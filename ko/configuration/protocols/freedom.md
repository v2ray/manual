---
refcn: chapter_02/protocols/freedom
refen: configuration/protocols/freedom
---
# Freedom

* Name: `freedom`
* Type: Outbound

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

Strategy for domain name resolution. Options are:

* `"AsIs"`: Default value. Resolve domain name by system.
* `"UseIP"`: Use [internal DNS](../dns.md) for domain name resolution.

> `redirect`: address_port

Redirect all connections to this address, in form like `"127.0.0.1:80"` or `":1234"`.

* When address is empty, e.g. `":443"`, Freedom will use the original destination address.
* When port is `0`, e.g. `"v2ray.com:0"`, Freedom will use the original port.

> `userLevel`: number

User level. All connections share this level.