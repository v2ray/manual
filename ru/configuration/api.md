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

## Список поддерживаемых API

### HandlerService

API для управления входящими и исходящими прокси. Доступны следующие функции:

* Добавление нового входящего/исходящего прокси.
* Удаление существующего входящего/исходящего прокси.
* Добавление нового пользователя входящего прокси (только для VMess).
* Удаление существующего пользователя входящего прокси (только для VMess).

### LoggerService

Перезапуск внутреннего логгера. Может работать с logrotate для оперирования файлами журнала.

### StatsService

Поддержка [внутренней статистики](stats.md).