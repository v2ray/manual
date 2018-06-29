# Routing

![Englisch](../resources/englishc.svg) [![Chinesisch](../resources/chinese.svg)](https://www.v2ray.com/chapter_02/03_routing.html)

V2Ray verfügt über einen internen Routing-Mechanismus. Es leitet eingehende Verbindungen basierend auf Regeln an verschiedene ausgehende Verbindungen weiter. Ein häufiges Szenario ist die Aufteilung des Datenverkehrs nach Ländern. V2Ray kann das Zielland (nach Geo-IP) einer Verbindung erkennen und sendet dann eine Verbindung zum entsprechenden ausgehenden Proxy.

Aufbau:

```javascript
{
  "strategy": "rules",
  "settings": {
    "domainStrategy": "AsIs",
    "rules": [
      {
        "type": "field",
        "domain": [
          "baidu.com",
          "qq.com"
        ],
        "outboundTag": "direct"
      }
    ]
  }
}
```

Woher:

* `strategy`: Der einzige gültige Wert für jetzt ist `"rules"`.
* `domainStrategy`: Strategie der Domänenauflösung. Auswahlmöglichkeiten sind: 
  * `"AsIs"`: Verwende nur die Domain für das Routing. Standardwert.
  * `"IPIfNonMatch"`: Wenn keine Regel der aktuellen Domäne entspricht, löst V2Ray sie in IP-Adressen (A- oder AAAA-Datensätze) auf und versucht alle Regeln erneut. 
    * Wenn eine Domäne mehrere IP-Adressen hat, versucht V2Ray alle von ihnen.
    * Die aufgelösten IPs werden nur für Routingentscheidungen verwendet. Der Datenverkehr wird weiterhin an die ursprüngliche Domänenadresse gesendet.
  * `"IPOnDemand"`: Solange es eine IP-basierte Regel gibt, löst V2Ray die Domäne sofort in IP auf.
* `rules`: Ein Array von Regeln. Für jede eingehende Verbindung versucht V2Ray diese Regeln von oben nach unten nacheinander auszuführen. Wenn eine Regel wirksam wird, wird die Verbindung an den Ausgang `outboundTag` der Regel weitergeleitet.

Konfiguration für jede Regel:

```javascript
{
  "type": "field",
  "domain": [
    "baidu.com",
    "qq.com",
    "geosite:cn"
  ],
  "ip": [
    "0.0.0.0/8",
    "10.0.0.0/8",
    "fc00::/7",
    "fe80::/10",
    "geoip:cn"
  ],
  "port": "0-100",
  "network": "tcp",
  "source": [
    "10.0.0.1",
  ],
  "user": [
    "love@v2ray.com"
  ],
  "inboundTag": [
    "tag-vmess"
  ],
  "outboundTag": "direct"
}
```

Woher:

* `type`: Der einzige gültige Wert für jetzt ist `"field"`.
* `domain`: Ein Array von Domänen. Es gibt vier Formate: 
  * Teilzeichenfolge: Wenn diese Zeichenfolge mit einem Teil der Zieldomäne übereinstimmt, wird diese Regel wirksam. Beispiel: Regel `"sina.com"` stimmt mit Targeting Domain `überein "sina.com"`, `"sina.com.cn"` und `"www.sina.com"`, aber nicht `"sina.cn"`.
  * Regulärer Ausdruck: Beginnt mit `"regexp:"`, der Rest ist ein regulärer Ausdruck. Wenn die reguläre Ausrichtungsdatei der Ausrichtungsdomäne entspricht, wird diese Regel wirksam. Beispiel: Regel `"regexp: \. Goo. * \. Com $"` entspricht `"www.google.com"` und `"fonts.googleapis.com"`, aber nicht `"google.com"`.
  * Subdomain: Beginnt mit `"domain:"` und der Rest ist eine Domain. Wenn die Ausrichtungsdomäne genau der Wert oder eine Unterdomäne des Werts ist, wird diese Regel wirksam. Beispiel: Regel `"domain: v2ray.com"` entspricht `"www.v2ray.com"`, `"v2ray.com"`, aber nicht `"xv2ray.com"`.
  * Gemeinsame Domänen in China: Sonderwert `"geosite: cn"` für eine Liste von [gemeinsamen Domänen in China](https://www.v2ray.com/links/chinasites/).
  * Domains aus Datei (V2Ray 3.23+): Wie `"ext: file: tag"`. Der Wert muss mit `ext:` (Kleinbuchstaben) beginnen, gefolgt von Dateiname und Tag. Die Datei wird in platziert [Ressourcenverzeichnis](env.md#location-of-v2ray-asset), und hat das gleiche Format von `geosite.dat`. Das Tag muss in der Datei vorhanden sein.
* `ip`: Ein Array von IP-Bereichen. Wenn sich die Targeting-IP in einem der Bereiche befindet, wird diese Regel wirksam. Es gibt drei Formate: 
  * IP: wie `"127.0.0.1"`.
  * [CIDR](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing): wie `"127.0.0.0/8"`.
  * GeoIP: wie `"geoip: cn"`. Es beginnt mit `GeoIP:` (Kleinbuchstaben) und gefolgt von zwei Buchstaben des Ländercodes. 
    * Sonderwert `"geoip: privat"`: für alle privaten Adressen wie `127.0.0.1`.
  * IPs aus Datei (V2Ray 3.23+): Wie `"ext: file: tag"`. Der Wert muss mit `ext:` (Kleinbuchstaben) beginnen, gefolgt von Dateiname und Tag. Die Datei wird in platziert [Ressourcenverzeichnis](env.md#location-of-v2ray-asset), und hat das gleiche Format von `geoip.dat`. Das Tag muss in der Datei vorhanden sein.
* `port`: Portbereich Formate sind: 
  * `"ab"`: Sowohl `a` als auch `b` sind positive ganze Zahlen und weniger als 65536. Wenn sich der Targeting-Port in [`a`, `b`, wird diese Regel wirksam.
  * `a`: `a` ist eine positive ganze Zahl und weniger als 65536. Wenn der Targeting-Port `a`, wird diese Regel wirksam.
* `network`: Die Auswahlmöglichkeiten sind `"tcp"`, `"udp"`oder `"tcp, udp"`. Wenn die Verbindung im ausgewählten Netzwerk vorhanden ist, wird diese Regel wirksam.
* `source`: Ein Array von IP-Bereichen. Gleiches Format wie `IP`. Wenn sich die Quell-IP der Verbindung im IP-Bereich befindet, wird diese Regel wirksam.
* `user`: Ein Array von E-Mail-Adresse. Wenn die eingehende Verbindung ein Benutzerkonto der E-Mail-Adresse verwendet, wird diese Regel wirksam. Momentan unterstützen Shadowsocks und VMess Benutzer mit E-Mail.
* `inboundTag`: Ein Array mit einer Zeichenfolge als eingehende Proxy-Tags. Wenn die Verbindung von einem der angegebenen eingehenden Proxyserver stammt, wird diese Regel wirksam.
* `outboundTag` [Tag des Ausgangs](protocols.md) , an den die Verbindung gesendet wird, wenn diese Regel wirksam wird.

## Tipps

* Wenn mehrere Attribute der Regel angegeben sind, müssen sie zusammen erfüllt sein, damit die Regel wirksam wird. 
  * Wenn Sie Verbindungen über `domain` oder `ip`routen möchten, benötigen Sie wahrscheinlich mehrere Regeln anstelle einer Regel, die sowohl `domain` als auch `ip`.
* `"ext:geoip.dat:cn"` entspricht `"geoip:cn"`.