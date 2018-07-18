# Freedom

[![Английский](../../resources/english.svg)](https://www.v2ray.com/en/configuration/protocols/freedom.html) [![Китайский](../../resources/chinese.svg)](https://www.v2ray.com/chapter_02/protocols/freedom.html) [![Немецкий](../../resources/german.svg)](https://www.v2ray.com/de/configuration/protocols/freedom.html) [![Русский](../../resources/russian.svg)](https://www.v2ray.com/ru/configuration/protocols/freedom.html)

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
* `redirect`: Redirect all connections to this address, in form like `"127.0.0.1:80"` or `":1234"`. 
  * (V2Ray 3.31+) When address is empty, e.g. `":443"`, Freedom will use the original destination address.
  * (V2Ray 3.31+) When port is `0`, e.g. `"v2ray.com:0"`, Freedom will use the original port.
* ` userLevel `: Пользовательский уровень. Все подключения проходят через этот уровень.