---
refcn: chapter_02/mux
refen: configuration/mux
---
# Мультиплексирование

Мультиплексирование или Mux - это использование одного физического TCP-соединения для нескольких виртуальных TCP-соединений. См. [Mux.Cool](https://www.v2ray.com/eng/protocols/muxcool.html) для более подробной информации о реализации.

Настройка:

```javascript
{
  "enabled": false,
  "concurrency": 8
}
```

Где:

* `enabled`: Включать Mux или нет
* `concurrency`: Max number of virtual connections that one physical connection can handle at a time. Max value `1024`, min value `1`, default `8`. 
  * Обычно это значение не требует дополнительной настройки.
* Mux is designed to reduce TCP handshake latency. It is NOT for high throughput. When used for downloading large files or speed measurement, Mux is usually slower than a normal TCP connection.