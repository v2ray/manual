# Freedom

[![English](../../resources/english.svg)](https://www.v2ray.com/en/configuration/protocols/freedom.html) [![Chinese](../../resources/chinese.svg)](https://www.v2ray.com/chapter_02/protocols/freedom.html) [![German](../../resources/german.svg)](https://www.v2ray.com/de/configuration/protocols/freedom.html) [![Russian](../../resources/russian.svg)](https://www.v2ray.com/ru/configuration/protocols/freedom.html)

Freedom - это протокол для исходящих соединений. Он передает все TCP или UDP соединение на указанные адреса.

* Название: freedom
* Тип: исходящий
* Конфигурация:

```javascript
{
  "domainStrategy": "AsIs",
  "redirect": "127.0.0.1:3366",
  "userLevel": 0
}
```

Где:

* `domainStrategy`: Стратегия разрешения доменных имен. Возможные варианты: 
  * `"AsIs"`: Значение по умолчанию. Доменные имена разрешаются системой.
  * ` "UseIP" `: Используйте [ внутренний DNS ](../dns.md) для получения доменных имен.
* `redirect`: Перенаправить все подключения к этому адресу в форме ` "127.0.0.1:80" ` или ` ":1234" `.
* ` userLevel `: Пользовательский уровень. Все подключения проходят через этот уровень.