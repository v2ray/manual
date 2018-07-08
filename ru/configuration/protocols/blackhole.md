# Протокол Backhole

![English](../../resources/englishc.svg) [![Chinese](../../resources/chinese.svg)](https://www.v2ray.com/chapter_02/protocols/blackhole.html)

Backhole это протокол для исходящих соединений. Он блокирует все соединения предопределёнными ответами. В комбинации с [Routing](../routing.md), его можно использовать для блокировки доступа к определённым веб-сайтам.

* Имя: blackhole
* Type: Outbound
* Configuration:

```javascript
{
  "response": {
    "type": "none"
  }
}
```

Where:

* `response`: Pre-defined response. Blockhole will send (if any) pre-defined data immediately for any connection passed to it and close the connection. 
  * `type`: Type of the response, available options are: 
    * `"none"`: Default value. Empty response.
    * `"http"`: A valid HTTP 403 response.