---
refcn: chapter_02/api
refen: configuration/api
---
# API

V2Ray provides some API for remote access. These APIs are based on [gRPC](https://grpc.io/).

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

* `tag`: Метка исходящего прокси.
* `services`: Список включённых API.

## Список поддерживаемых API

### HandlerService

API for manipulating inbound and outbound proxies. The following functionalities are provided:

* Добавление нового входящего/исходящего прокси.
* Удаление существующего входящего/исходящего прокси.
* Добавление нового пользователя входящего прокси (только для VMess).
* Удаление существующего пользователя входящего прокси (только для VMess).

### LoggerService

To restart internal logger. Can work with logrotate for operating log files.

### StatsService

Поддержка [внутренней статистики](stats.md).