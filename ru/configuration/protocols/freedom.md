---
refcn: chapter_02/protocols/freedom
refen: configuration/protocols/freedom
---
# Freedom

* Название: `freedom`
* Тип: исходящий

Freedom is a protocol for outbound connections. It passes all TCP or UDP connection to their destinations. This outbound is used when you want to send traffic to its real destination.

## ConfigurationObject

```javascript
{
  "domainStrategy": "AsIs",
  "redirect": "127.0.0.1:3366",
  "userLevel": 0
}
```

> `domainStrategy`: "AsIs" | "UseIP"

Стратегия разрешения доменных имен. Возможные варианты:

* `"AsIs"`: Значение по умолчанию. Доменные имена разрешаются системой.
* ` "UseIP" `: Используйте [ внутренний DNS ](../dns.md) для получения доменных имен.
* `"UseIPv4"`: Use IPv4 address only, after resolved by internal DNS.
* `"UseIPv6"`: Use IPv6 address only, after resolved by internal DNS.

(V2Ray 4.6+) In `UseIP` mode, when `sendThrough` is specified in [OutboundObject](../overview.md#outboundobject), Freedom will automatically choose between IPv4 and IPv6 address for destination based on `sendThrough` settings.

(V2Ray 4.7+) If `sendThrough` address conflicts with `"UseIPv4"` or `"UseIPv6"`, Freedom will fail to dial out-going connections.

> `redirect`: address_port

Перенаправление всех соединений на указанный адрес вида `"127.0.0.1:80"` или `":1234"`.

* Если адрес не указан, например `":443"`, Freedom будет использовать исходный адрес назначения.
* Если указан порт `0`, например `"v2ray.com:0"`, Freedom будет использовать исходный порт.

> `userLevel`: number

Пользовательский уровень. Все подключения имеют этот уровень.