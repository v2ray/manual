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
    {
      "address": "1.2.3.4",
      "port": 5353,
      "domains": [
        "domain:v2ray.com"
      ],
    },
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
* `Server`: List of DNS servers. Each server may be specified in two formats: 
  * Basic: A string such as `"8.8.8.8"` for DNS server address with port `53`. When the value is `"localhost"`, V2Ray queries localhost for DNS.
  * Complete (V2Ray 3.42+): 
    * `address`: DNS server address, such as `"8.8.8.8"`.
    * `port`: DNS server port, such as `53`.
    * `domains`: List of domains that are prioritized for this server. The format of a domain is the same as it is in [routing config](routing.md).
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
* When using localhost as DNS server, outbound DNS queries are not sent through V2Ray by default. You may need some settings to intercept those queries if necessary.
* When a DNS server has the domain in its domain list, the domain will be queries in this server first, and then other servers. Otherwise DNS queries are sent to DNS servers in the order they appear in the config file.