# Dokodemo-Door

![Englisch](../../resources/englishc.svg) [![Chinesisch](../../resources/chinese.svg)](https://www.v2ray.com/chapter_02/protocols/dokodemo.html)

Dokodemo-door ist ein Protokoll für eingehende Verbindungen. Es nimmt alle Verbindungen und übergibt sie an das angegebene Ziel.

Dokodemo-door kann auch (wenn konfiguriert) als transparenter Proxy arbeiten.

* Name: dokodemo-tür
* Typ: Eingehend
* Aufbau:

```javascript
{
  "address": "8.8.8.8",
  "port": 53,
  "network": "tcp",
  "followRedirect": false,
  "userLevel": 0
}
```

Woher:

* `Adresse`: Adresse des Zielservers. Kann eine IPv4-, IPv6- oder eine Domäne in Zeichenfolgenform sein. 
  * Wenn `followRedirect` (siehe unten) ist `wahr`, `Adresse` kann leer sein.
* `Port`: Port des Zielservers. Ganze Zahl.
* `Netzwerk`: Typ des Netzwerks, entweder "TCP" oder "UDP".
* `FolgenRedirect`: Wenn der Wert `wahr`, erkennt dokodemo-door das Ziel von TProxy und verwendet es als Ziel. 
  * Funktioniert nur unter Linux
  * Unterstützt TCP / IPv4-Verbindungen
  * Unterstützt UDP / IPv4-Pakete. Erfordert die Berechtigung root (CAP \ _NET \ _ADMIN)
* `userLevel`: Benutzerebene. Alle Verbindungen teilen diese Ebene. Siehe [Richtlinie](../policy.md) für Details.

## Beispiele für transparenten Proxy

Fügen Sie eine dokodemo-Tür eingehend wie folgt hinzu.

```javascript
{"Netzwerk": "tcp, udp", "Zeitüberschreitung": 30, "followRedirect": true}
```

Konfigurieren Sie iptables wie folgt.

```plain
# Create new chain root @ Wrt: ~ # iptables -t nat -N V2RAY root @ Wrt: ~ # iptables -t mangle -N V2RAY root @ Wrt: ~ # iptables -t mangle -N V2RAY_MARK # Ignoriere die Adresse deines V2Ray-Servers # Es ist sehr wichtig, sei einfach vorsichtig.
root @ Wrt: ~ # iptables -t nat -A V2RAY -d 123.123.123.123 -j RÜCKKEHR # Ignorieren von LANs und anderen Adressen, die Sie den Proxy umgehen möchten # Eine vollständige Liste der reservierten Netzwerke finden Sie unter Wikipedia und RFC5735.
root @ Wrt: ~ # iptables -t nat -A V2RAY -d 0.0.0.0/8 -j RETURN Wurzel @ Wrt: ~ # iptables -t nat -A V2RAY -d 10.0.0.0/8 -j RETURN Wurzel @ Wrt: ~ # iptables -t nat -A V2RAY -d 127.0.0.0/8 -j RETURN Wurzel @ Wrt: ~ # iptables -t nat -A V2RAY -d 169.254.0.0/16 -j RETURN Wurzel @ Wrt: ~ # iptables - t nat -A V2RAY -d 172.16.0.0/12 -j RETURN Wurzel @ Wrt: ~ # iptables -t nat -A V2RAY -d 192.168.0.0/16 -j RETURN Wurzel @ Wrt: ~ # iptables -t nat -A V2RAY -d 224.0.0.0/4 -j RETURN Wurzel @ Wrt: ~ # iptables -t nat -A V2RAY -d 240.0.0.0/4 -j ZURÜCK # Alles andere sollte zu Dokodemo-doors lokalen Port root @ Wrt umgeleitet werden: ~ # iptables -t nat -A V2RAY -p tcp -j REDIRECT --zu-ports 12345 # Fügen Sie alle UDP-Regeln root @ Wrt hinzu: ~ # ip route hinzufügen lokalen Standard dev lo Tabelle 100 root @ Wrt: ~ # ip rule add fwmark 1 lookup 100 Wurzel @ Wrt: ~ # iptables -t mangle -A V2RAY -p udp --dport 53 -j TPROXY --on-port 12345 --tproxy-Markierung 0x01 / 0x01 root @ Wrt: ~ # iptables -t mangle -A V2RAY_MARK -p udp --dport 53 -j MARK --set-mark 1 # Wende die Regeln root @ Wrt an: ~ # iptables -t nat - A OUTPUT -p tcp -j V2RAY Wurzel @ Wrt: ~ # iptables -t mangle -A PREROUTING -j V2RAY Wurzel @ Wrt: ~ # iptables -t mangle -A OUTPUT -j V2RAY_MARK
```