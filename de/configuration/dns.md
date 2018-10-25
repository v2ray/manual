---
refcn: chapter_02/04_dns
refen: configuration/dns
---
# DNS

V2Ray verfügt über einen internen DNS-Server, der DNS-Relay für andere Komponenten bereitstellt.

Konfiguration:

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
  "clientIp": "1.2.3.4"
}
```

Wo:

* `Gastgeber`: Eine Liste von statischen IP-Adressen. Jeder Eintrag hat einen Domänennamen als Schlüssel und IP-Adresse als Wert. Wenn eine DNS-Abfrage auf eine der Domänen in dieser Liste abzielt, wird die entsprechende IP-Adresse sofort zurückgegeben und die DNS-Abfrage wird nicht weitergeleitet. Das Format der Domäne ist: 
  * Beispiel: `"v2ray.com"`: Die Domäne, die aufgelöst werden soll, muss dieser Domäne entsprechen.
  * Beispiel: `"domain: v2ray.com"`: Die Domäne, die aufgelöst werden soll, kann diese Domäne oder eine ihrer Unterdomänen sein.
* `Server`: List of DNS servers. Each server may be specified in two formats: 
  * Basic: A string such as `"8.8.8.8"` for DNS server address with port `53`. When the value is `"localhost"`, V2Ray queries localhost for DNS.
  * Complete (V2Ray 3.42+): 
    * `address`: DNS server address, such as `"8.8.8.8"`.
    * `port`: DNS server port, such as `53`.
    * `domains`: List of domains that are prioritized for this server. The format of a domain is the same as it is in [routing config](routing.md).
* `clientIp`: IPv4 address of current system. This is used to notify DNS server for better IP resolution. The value can't be a private address.

Um den internen DNS-Dienst zu verwenden, müssen Sie `domainStrategy` in [routing](routing.md)konfigurieren.

The DNS queries relayed by this DNS service will also be dispatched based on routing settings. No extra configuration is required.

## Query strategy {#strategy}

Der DNS-Dienst versucht, sowohl den A- als auch den AAAA-Datensatz in derselben DNS-Nachricht abzufragen. Da nicht alle DNS-Server eine solche Abfrage unterstützen, sendet V2Ray nur die A- und AAAA-Abfrage an die folgenden DNS-Server und sendet nur A-Abfragen an alle anderen Server.

```text
8.8.8.8 8.8.4.4 9.9.9.9
```

## Tipps {#tips}

* Es wird empfohlen, DNS von Ihrem lokalen Host mit einem Drittanbieter-DNS-Relayserver zu verwenden, z. B. [CoreDNS](https://coredns.io/).
* When using localhost as DNS server, outbound DNS queries are not sent through V2Ray by default. You may need some settings to intercept those queries if necessary.
* When a DNS server has the domain in its domain list, the domain will be queries in this server first, and then other servers. Otherwise DNS queries are sent to DNS servers in the order they appear in the config file.