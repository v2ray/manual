---
refcn: chapter_02/protocols/dns
refen: configuration/protocols/dns
---

# DNS

* Название: `dns`
* Тип: исходящий

DNS is an outbound proxy. Он используется в основном для перехвата и проксирования DNS запросов и ответов. Этот прокси пропускает только DNS-запросы по TCP и UDP. Другой тип трафика приведет к ошибкам.

При проксировании DNS-запросов исходящий DNS перенаправляет запросы IP (A и AAAA) на [внутренний DNS-сервер](../dns.md). It will send other type of queries directly to its original destination.

Исходящий прокси DNS добавлен в V2Ray 4.15.

## OutboundConfigurationObject

```javascript
{
    "network": "tcp",
    "address": "1.1.1.1",
    "port": 53
}
```

> `network`: "tcp" | "udp"

(V2Ray 4.16+) Транспортный протокол DNS трафика. Значение может быть `"tcp"` или `"udp"`. Если не указано, то исходный протокол остается неизменным.

> `address`: адрес

(V2Ray 4.16+) Адрес DNS-сервера в запросе. Если не указано, то адрес сервера не изменяется.

> `port`: number

(V2Ray 4.16+) Порт DNS-сервера в запросе. Если не указано, то порт сервера не изменяется.