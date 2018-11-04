---
refcn: chapter_02/04_dns
refen: configuration/dns
---
# DNS

V2Ray имеет внутренний DNS-сервер, используемый другими компонентами.

{% hint style='info' %} Due to the complexity of DNS protocol, V2Ray for now only supports basic IP queries (A and AAAA). We recommend to use a professional DNS rely (such as [CoreDNS](https://coredns.io/)) for V2Ray. {% endhint %}

Configuration:

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

Where:

* `hosts`: Список статических IP-адресов. Каждая запись имеет имя домена в качестве ключа и IP-адрес как значение. Если цель DNS-запроса есть в списке, немедленно будет возвращен соответствующий IP, а запрос DNS дальше не пойдёт. Формат домена: 
  * `"v2ray.com"`: Домен для разрешения, должен быть идентичен заданному.
  * `"domain:v2ray.com"`: По такой схеме будет разрешаться как заданный домен, так и его поддомены.
* `servers`: Список DNS-серверов. Каждый сервер может быть указан в двух форматах: 
  * Упрощённый: строка типа `"8.8.8.8"` для DNS-сервера, слушающего порт `53`. Ели указан `"localhost"`, V2Ray разрешает имена через localhost.
  * Полный (V2Ray 3.42+): 
    * `address`: Адрес DNS-сервера, типа `"8.8.8.8"`.
    * `port`: Порт DNS-сервера, например `53`.
    * `domains`: Список доменов, приоритетных для этого сервера. Формат доменов такой же, как и в [Маршрутизации](routing.md).
* `clientIp`: IPv4-адрес текущей системы. Используется для уведомления DNS-сервера для лучшего разрешения IP. Значение не может быть адресом из частных ("серых") диапазонов.

To use the internal DNS service, you need to configure `domainStrategy` in [routing](routing.md).

The DNS queries relayed by this DNS service will also be dispatched based on routing settings. No extra configuration is required.

## Стратегия запросов {#strategy}

DNS service will try to query both A and AAAA record in the same DNS message. As not all DNS servers support such query, V2Ray only sends A and AAAA query to the following DNS servers, and only send A queries to all other servers.

```text
8.8.8.8
8.8.4.4
9.9.9.9
```

## Советы {#tips}

* Рекомендуется использовать DNS с вашего локального хоста с DNS-сервером от третьей стороны, например [CoreDNS](https://coredns.io/).
* При использовании localhost в качестве DNS-сервера исходящие DNS-запросы по умолчанию не отправляются через V2Ray. Возможно, вам понадобится изменить некоторые настройки для перехвата этих запросов.
* When a DNS server has the domain in its domain list, the domain will be queries in this server first, and then other servers. Otherwise DNS queries are sent to DNS servers in the order they appear in the config file.