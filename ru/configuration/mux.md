# Мультиплексирование

![English](../resources/englishc.svg) [![Chinese](../resources/chinese.svg)](https://www.v2ray.com/chapter_02/mux.html)

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
  * Usually you don't have to configure this value.