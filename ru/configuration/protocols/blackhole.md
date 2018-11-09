---
refcn: chapter_02/protocols/blackhole
refen: configuration/protocols/blackhole
---
# Backhole

* Название: `blackhole`
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

Если задан, Backhole немедленно отправит его в ответ на запрос и закроет соединение.

### ResponseObject

```javascript
{
  "type": "none"
}
```

> `type`: "none" | "http"

Тип ответа, доступные параметры:

* `"none"`: Значение по умолчанию. Пустой ответ.
* ` "HTTP" `: Ответ кодом состояния HTTP 403 Forbidden.