# DNS

[![Английский](../resources/english.svg)](https://www.v2ray.com/en/configuration/dns.html) [![Китайский](../resources/chinese.svg)](https://www.v2ray.com/chapter_02/04_dns.html) [![Немецкий](../resources/german.svg)](https://www.v2ray.com/de/configuration/dns.html) [![Русский](../resources/russian.svg)](https://www.v2ray.com/ru/configuration/dns.html)

V2Ray имеет внутренний DNS-сервер, используемый другими компонентами.

Настройка:

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

Где:

* `hosts`: Список статических IP-адресов. Каждая запись имеет имя домена в качестве ключа и IP-адрес как значение. Если цель DNS-запроса есть в списке, немедленно будет возвращен соответствующий IP, а запрос DNS дальше не пойдёт. Формат домена: 
  * `"v2ray.com"`: Домен для разрешения, должен быть идентичен заданному.
  * `"domain:v2ray.com"`: По такой схеме будет разрешаться как заданный домен, так и его поддомены.
* `servers`: Список DNS-серверов. Если задано несколько серверов, они будут опрашиваться сверху вниз. Параметры для DNS-адресов: 
  * `"IP"`: IP-адрес, 53-й порт которого открыт для DNS-запросов.
  * `"localhost"`: Особое значение, V2Ray будет разрешать DNS-запросы на локальной машине.
* `clientIp`: IPv4 address of current system. This is used to notify DNS server for better IP resolution. The value can't be a private address.

To use the internal DNS service, you need to configure `domainStrategy` in [routing](routing.md).

The DNS queries relayed by this DNS service will also be dispatched based on routing settings. No extra configuration is required.

## Стратегия запросов {#strategy}

DNS service will try to query both A and AAAA record in the same DNS message. As not all DNS servers support such query, V2Ray only sends A and AAAA query to the following DNS servers, and only send A queries to all other servers.

```text
8.8.8.8
8.8.4.4
9.9.9.9
```

## Подсказки {#tips}

* You are recommended to use DNS from your localhost, with a thirdparty DNS relay server, such as [CoreDNS](https://coredns.io/).