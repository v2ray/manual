# API

[![English](../resources/english.svg)](https://www.v2ray.com/en/configuration/api.html) [![Chinese](../resources/chinese.svg)](https://www.v2ray.com/chapter_02/api.html) [![German](../resources/german.svg)](https://www.v2ray.com/de/configuration/api.html) [![Russian](../resources/russian.svg)](https://www.v2ray.com/ru/configuration/api.html)

V2Ray предоставляет API для удаленного доступа. Эти API основаны на [gRPC](https://grpc.io/).

When API is enabled, V2Ray creates an outbound proxy automatically, tagged as `tag`. User must [route](routing.md) all gRPC connections to this outbound.

Настройка:

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

Где:

* `tag`: The tag of the outbound proxy.
* `services`: Список включённых API.

## Список поддерживаемых API

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