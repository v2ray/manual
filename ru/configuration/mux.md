# Мультиплексирование

[![Английский](../resources/english.svg)](https://www.v2ray.com/en/configuration/mux.html) [![Китайский](../resources/chinese.svg)](https://www.v2ray.com/chapter_02/mux.html) [![Немецкий](../resources/german.svg)](https://www.v2ray.com/de/configuration/mux.html) [![Русский](../resources/russian.svg)](https://www.v2ray.com/ru/configuration/mux.html)

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
* `concurrency`: Максимальное количество виртуальных подключений, которое может обрабатывать одно физическое соединение за раз. Максимальное значение `1024`, минимальное значение `1`, по умолчанию `8`. 
  * Обычно это значение не требует дополнительной настройки.