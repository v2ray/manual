# API

[![Английский](../resources/english.svg)](https://www.v2ray.com/en/configuration/api.html) [![Китайский](../resources/chinese.svg)](https://www.v2ray.com/chapter_02/api.html) [![Немецкий](../resources/german.svg)](https://www.v2ray.com/de/configuration/api.html) [![Русский](../resources/russian.svg)](https://www.v2ray.com/ru/configuration/api.html)

V2Ray предоставляет API для удаленного доступа. Эти API основаны на [gRPC](https://grpc.io/).

Когда API включено, V2Ray автоматически создает исходящий прокси, помеченный через `tag`. User must [route](routing.md) all gRPC connections to this outbound.

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

* `tag`: Метка исходящего прокси.
* `services`: Список включённых API.

## Список поддерживаемых API

### HandlerService

API for manipulating inbound and outbound proxies. The following functionalities are provided:

* Add a new inbound/outbound proxy.
* Remove an existing inbound/outbound proxy.
* Add a new user to an inbound proxy (VMess only).
* Remove an existing user from an inbound proxy (VMess only).

### LoggerService

Перезапуск внутреннего логгера. Can work with logrotate for operating log files.

### StatsService

Поддержка [внутренней статистики](stats.md).