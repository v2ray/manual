---
refcn: chapter_02/protocols/blackhole
refen: configuration/protocols/blackhole
---
# Backhole

* Название: blackhole
* Тип: исходящий

Backhole - это протокол для исходящих соединений. Он блокирует все соединения предопределёнными ответами. В сочетании с [Маршрутизацией](../routing.md), он может быть использован для блокировки доступа к определённым веб-сайтам.

## ConfigurationObject

```javascript
{
  "response": {
    "type": "none"
  }
}
```

> `response`: [ResponseObject](#responseobject)

Pre-defined response. Blockhole will send (if any) pre-defined data immediately for any connection passed to it and close the connection.

### ResponseObject

```javascript
{
  "type": "none"
}
```

> `type`: "none" | "http"

Type of the response, available options are:

* `"none"`: Default value. Empty response.
* `"http"`: A valid HTTP 403 response.