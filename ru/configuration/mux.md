---
refcn: chapter_02/mux
refen: configuration/mux
---
# Мультиплексирование

Мультиплексирование или Mux - это использование одного физического TCP-соединения для нескольких виртуальных TCP-соединений. См. [Mux.Cool](https://www.v2ray.com/eng/protocols/muxcool.html) для более подробной информации о реализации.

Конфигурация:

```javascript
{
  "enabled": false,
  "concurrency": 8
}
```

Где:

* `enabled`: Включать Mux или нет
* `concurrency`: Максимальное количество виртуальных подключений, которое может обрабатывать одно физическое соединение за раз. Максимум: `1024`. Минимум: `1`. По умолчанию: `8`. 
  * Обычно это значение не требует дополнительной настройки.
* Mux is designed to reduce TCP handshake latency. It is NOT for high throughput. When used for downloading large files or speed measurement, Mux is usually slower than a normal TCP connection.