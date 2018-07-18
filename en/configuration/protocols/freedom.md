# Freedom

[![English][1]][2] [![Chinese][3]][4] [![German][5]][6] [![Russian][7]][8]

[1]: ../../resources/english.svg
[2]: https://www.v2ray.com/en/configuration/protocols/freedom.html
[3]: ../../resources/chinese.svg
[4]: https://www.v2ray.com/chapter_02/protocols/freedom.html
[5]: ../../resources/german.svg
[6]: https://www.v2ray.com/de/configuration/protocols/freedom.html
[7]: ../../resources/russian.svg
[8]: https://www.v2ray.com/ru/configuration/protocols/freedom.html

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
  * (V2Ray 3.31+) When address is empty, e.g. `":443"`, Freedom will use the original destination address.
  * (V2Ray 3.31+) When port is `0`, e.g. `"v2ray.com:0"`, Freedom will use the original port.
* `userLevel`: User level. All connections share this level.
