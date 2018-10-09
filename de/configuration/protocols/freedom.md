---
refcn: chapter_02/protocols/freedom
refen: configuration/protocols/freedom
---
# Freiheit

Freedom is a protocol for outbound connections. It passes all TCP or UDP connection to their destinations.

* Name: Freiheit
* Typ: Ausgehend
* Aufbau:

```javascript
{
  "domainStrategy": "AsIs",
  "redirect": "127.0.0.1:3366",
  "userLevel": 0
}
```

Woher:

* `domainStrategy`: Strategy for domain name resolution. Options are: 
  * `"AsIs"`: Default. Resolve domain name by system.
  * `"UseIP"`: Use [internal DNS](../dns.md) for domain name resolution.
* `redirect`: Redirect all connections to this address, in form like `"127.0.0.1:80"` or `":1234"`. 
  * When address is empty, e.g. `":443"`, Freedom will use the original destination address.
  * When port is `0`, e.g. `"v2ray.com:0"`, Freedom will use the original port.
* `userLevel`: User level. All connections share this level.