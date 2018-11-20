---
refcn: chapter_02/protocols/freedom
refen: configuration/protocols/freedom
---
# Freedom

* Name: `freedom`
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

* `"AsIs"`: Default value. Resolve domain name by system.
* ` "UseIP" `: Используйте [ внутренний DNS ](../dns.md) для получения доменных имен.

(V2Ray 4.6+) In `UseIP` mode, when `sendThrough` is specified in [OutboundObject](../overview.md#outboundobject), Freedom will automatically choose between IPv4 and IPv6 address for destination based on `sendThrough` settings.

> `redirect`: address_port

Redirect all connections to this address, in form like `"127.0.0.1:80"` or `":1234"`.

* Если адрес не указан, например `":443"`, Freedom будет использовать исходный адрес назначения.
* Если указан порт `0`, например `"v2ray.com:0"`, Freedom будет использовать исходный порт.

> `userLevel`: number

User level. All connections share this level.