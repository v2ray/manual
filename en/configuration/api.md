# API

[![English][1]][2] [![Chinese][3]][4] [![German][5]][6] [![Russian][7]][8]

[1]: ../resources/english.svg
[2]: https://www.v2ray.com/en/configuration/api.html
[3]: ../resources/chinese.svg
[4]: https://www.v2ray.com/chapter_02/api.html
[5]: ../resources/german.svg
[6]: https://www.v2ray.com/de/configuration/api.html
[7]: ../resources/russian.svg
[8]: https://www.v2ray.com/ru/configuration/api.html

V2Ray provides some API for remote access. These APIs are based on [gRPC](https://grpc.io/).

When API is enabled, V2Ray creates an outbound proxy automatically, tagged as `tag`. User must [route](routing.md) all gRPC connections to this outbound.

Configuration:

```javascript
{
  "tag": "api",
  "services": [
    "HandlerService",
    "LoggerService",
    "StatsService"
  ]
}
```

Where:

* `tag`: The tag of the outbound proxy.
* `services`: List of enabled APIs.

## Supported API list

### HandlerService

API for manipulating inbound and outbound proxies. The following functionalities are provided:

* Add a new inbound/outbound proxy.
* Remove an existing inbound/outbound proxy.
* Add a new user to an inbound proxy (VMess only).
* Remove an existing user from an inbound proxy (VMess only).

### LoggerService

To restart internal logger. Can work with logrotate for operating log files.

### StatsService

Support for internal [Statistics](stats.md).
