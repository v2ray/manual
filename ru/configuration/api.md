# API

[![Английский](../resources/english.svg)](https://www.v2ray.com/en/configuration/api.html) [![Китайский](../resources/chinese.svg)](https://www.v2ray.com/chapter_02/api.html) [![Немецкий](../resources/german.svg)](https://www.v2ray.com/de/configuration/api.html) [![Русский](../resources/russian.svg)](https://www.v2ray.com/ru/configuration/api.html)

V2Ray предоставляет API для удаленного доступа. Эти API основаны на [gRPC](https://grpc.io/).

Когда API включено, V2Ray автоматически создает исходящий прокси, помеченный через `tag`. Пользователь должен [маршрутизировать](routing.md) все соединения gRPC в этот прокси.

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

API для управления входящими и исходящими прокси. Доступны следующие функции:

* Добавление нового входящего/исходящего прокси.
* Удаление существующего входящего/исходящего прокси.
* Добавление нового пользователя входящего прокси (только для VMess).
* Удаление существующего пользователя входящего прокси (только для VMess).

### LoggerService

Перезапуск внутреннего логгера. Может работать с logrotate для оперирования файлами журнала.

### StatsService

Поддержка [внутренней статистики](stats.md).