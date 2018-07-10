# DNS

[![English](../resources/english.svg)](https://www.v2ray.com/en/configuration/dns.html) [![Chinese](../resources/chinese.svg)](https://www.v2ray.com/chapter_02/04_dns.html) [![German](../resources/german.svg)](https://www.v2ray.com/de/configuration/dns.html) [![Russian](../resources/russian.svg)](https://www.v2ray.com/ru/configuration/dns.html)

V2Ray verfügt über einen internen DNS-Server, der DNS-Relay für andere Komponenten bereitstellt.

Aufbau:

```javascript
{
  "hosts": {
    "baidu.com": "127.0.0.1"
  },
  "servers": [
    "8.8.8.8",
    "8.8.4.4",
    "localhost"
  ],
  "clientIp": "1.2.3.4",
}
```

Woher:

* `Gastgeber`: Eine Liste von statischen IP-Adressen. Jeder Eintrag hat einen Domänennamen als Schlüssel und IP-Adresse als Wert. Wenn eine DNS-Abfrage auf eine der Domänen in dieser Liste abzielt, wird die entsprechende IP-Adresse sofort zurückgegeben und die DNS-Abfrage wird nicht weitergeleitet. Das Format der Domäne ist: 
  * Beispiel: `"v2ray.com"`: Die Domäne, die aufgelöst werden soll, muss dieser Domäne entsprechen.
  * Beispiel: `"domain: v2ray.com"`: Die Domäne, die aufgelöst werden soll, kann diese Domäne oder eine ihrer Unterdomänen sein.
* `Server`: Eine Liste der DNS-Serveradressen. Wenn mehrere Server vorhanden sind, werden sie von oben nach unten abgefragt. Optionen für die DNS-Adresse: 
  * `"IP"`: Eine IP-Adresse, deren Port 53 für die DNS-Abfrage geöffnet ist.
  * `"localhost"`: Ein spezieller Wert, dass V2Ray die DNS-Abfrage von der lokalen Maschine verwendet.
* `clientIp`: IPv4-Adresse des aktuellen Systems. Dies wird verwendet, um den DNS-Server für eine bessere IP-Auflösung zu benachrichtigen. Der Wert darf keine private Adresse sein.

Um den internen DNS-Dienst zu verwenden, müssen Sie `domainStrategy` in [routing](routing.md)konfigurieren.

Die DNS-Abfragen, die von diesem DNS-Dienst weitergeleitet werden, werden ebenfalls basierend auf Routingeinstellungen ausgelöst. Es ist keine zusätzliche Konfiguration erforderlich.

## Query strategy {#strategy}

Der DNS-Dienst versucht, sowohl den A- als auch den AAAA-Datensatz in derselben DNS-Nachricht abzufragen. Da nicht alle DNS-Server eine solche Abfrage unterstützen, sendet V2Ray nur die A- und AAAA-Abfrage an die folgenden DNS-Server und sendet nur A-Abfragen an alle anderen Server.

```text
8.8.8.8 8.8.4.4 9.9.9.9
```

## Tips {#tips}

* Es wird empfohlen, DNS von Ihrem lokalen Host mit einem Drittanbieter-DNS-Relayserver zu verwenden, z. B. [CoreDNS](https://coredns.io/).