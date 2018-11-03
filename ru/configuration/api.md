---
refcn: chapter_02/api
refen: configuration/api
---
# API

V2Ray предоставляет API для удаленного доступа. Эти API основаны на [gRPC](https://grpc.io/).

Когда API включено, V2Ray автоматически создает исходящий прокси, помеченный через `tag`. Пользователь должен [маршрутизировать](routing.md) все соединения gRPC в этот прокси.

## ApiObject

`ApiObject` is used as `api` field in top level configuration.

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

> `tag`: string

The tag of the outbound proxy.

> `services`: \[ string \]

List of enabled APIs.

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