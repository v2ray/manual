---
refcn: chapter_02/protocols/blackhole
refen: configuration/protocols/blackhole
---
# Backhole

Backhole - это протокол для исходящих соединений. Он блокирует все соединения предопределёнными ответами. В сочетании с [Маршрутизацией](../routing.md), он может быть использован для блокировки доступа к определённым веб-сайтам.

* Название: blackhole
* Тип: исходящий
* Configuration:

```javascript
{
  "response": {
    "type": "none"
  }
}
```

Где:

* `response`: Pre-defined response. Blockhole will send (if any) pre-defined data immediately for any connection passed to it and close the connection. 
  * `type`: Тип ответа, доступные параметры: 
    * `"none"`: Default value. Empty response.
    * ` "HTTP" `: Ответ кодом состояния HTTP 403 Forbidden.