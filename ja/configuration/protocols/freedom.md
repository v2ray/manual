# Freedom

[![English](../../resources/english.svg)](https://www.v2ray.com/en/configuration/protocols/freedom.html) [![Chinese](../../resources/chinese.svg)](https://www.v2ray.com/chapter_02/protocols/freedom.html) [![German](../../resources/german.svg)](https://www.v2ray.com/de/configuration/protocols/freedom.html) [![Russian](../../resources/russian.svg)](https://www.v2ray.com/ru/configuration/protocols/freedom.html)

Freedom is a protocol for outbound connections. It passes all TCP or UDP connection to their destinations.

* Name: freedom
* Type: Outbound
* Configuration:

```javascript
{
  "domainStrategy": "AsIs",
  "redirect": "127.0.0.1:3366",
  "userLevel": 0
}
```

Where:

* `domainStrategy`: Strategy for domain name resolution. Options are: 
  * `"AsIs"`: Default. Resolve domain name by system.
  * `"UseIP"`: Use [internal DNS](../dns.md) for domain name resolution.
* `redirect`: Redirect all connections to this address, in form like `"127.0.0.1:80"` or `":1234"`.
* `userLevel`: User level. All connections share this level.