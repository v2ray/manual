---
refcn: chapter_02/04_dns
refen: configuration/dns
---
# DNS

V2Ray имеет внутренний DNS-сервер, используемый другими компонентами.

Настройка:

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

Где:

* `hosts`: Список статических IP-адресов. Каждая запись имеет имя домена в качестве ключа и IP-адрес как значение. Если цель DNS-запроса есть в списке, немедленно будет возвращен соответствующий IP, а запрос DNS дальше не пойдёт. Формат домена: 
  * `"v2ray.com"`: Домен для разрешения, должен быть идентичен заданному.
  * `"domain:v2ray.com"`: По такой схеме будет разрешаться как заданный домен, так и его поддомены.
* `servers`: List of DNS servers. Each server may be specified in two formats: 
  * Basic: A string such as `"8.8.8.8"` for DNS server address with port `53`. When the value is `"localhost"`, V2Ray queries localhost for DNS.
  * Полный (V2Ray 3.42+): 
    * `address`: Адрес DNS-сервера, типа `"8.8.8.8"`.
    * `port`: Порт DNS-сервера, например `53`.
    * `domains`: List of domains that are prioritized for this server. The format of a domain is the same as it is in [routing config](routing.md).
* `clientIp`: IPv4 address of current system. This is used to notify DNS server for better IP resolution. The value can't be a private address.

Чтобы использовать внутренний DNS, вам необходимо настроить `domainStrategy` в [маршрутизации](routing.md).

The DNS queries relayed by this DNS service will also be dispatched based on routing settings. No extra configuration is required.

## Стратегия запросов {#strategy}

Служба DNS попытается получить и A, и AAAA в одном DNS-запросе. Поскольку не все DNS-серверы поддерживают такой формат, V2Ray отправляет объединённые запросы только на следующие DNS-серверы. С остальных серверов запрашивается только A-запись.

```text
8.8.8.8
8.8.4.4
9.9.9.9
```

## Советы {#tips}

* Рекомендуется использовать DNS с вашего локального хоста с DNS-сервером от третьей стороны, например [CoreDNS](https://coredns.io/).
* When using localhost as DNS server, outbound DNS queries are not sent through V2Ray by default. You may need some settings to intercept those queries if necessary.
* When a DNS server has the domain in its domain list, the domain will be queries in this server first, and then other servers. Otherwise DNS queries are sent to DNS servers in the order they appear in the config file.