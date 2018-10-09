---
refcn: chapter_02/protocols/freedom
refen: configuration/protocols/freedom
---
# Freedom

Freedom is a protocol for outbound connections. It passes all TCP or UDP connection to their destinations.

* Название: freedom
* Тип: исходящий
* Настройка:

```javascript
{
  "domainStrategy": "AsIs",
  "redirect": "127.0.0.1:3366",
  "userLevel": 0
}
```

Где:

* `domainStrategy`: Strategy for domain name resolution. Options are: 
  * `"AsIs"`: Default. Resolve domain name by system.
  * ` "UseIP" `: Используйте [ внутренний DNS ](../dns.md) для получения доменных имен.
* `redirect`: Redirect all connections to this address, in form like `"127.0.0.1:80"` or `":1234"`. 
  * Если адрес не указан, например `":443"`, Freedom будет использовать исходный адрес назначения.
  * Если указан порт `0`, например `"v2ray.com:0"`, Freedom будет использовать исходный порт.
* `userLevel`: User level. All connections share this level.