* * *

refcn: chapter_02/protocols/freedom refen: configuration/protocols/freedom

* * *

# Freedom

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
* `redirect`: Перенаправление всех соединений на указанный адрес вида `"127.0.0.1:80"` или `":1234"`. 
  * When address is empty, e.g. `":443"`, Freedom will use the original destination address.
  * When port is `0`, e.g. `"v2ray.com:0"`, Freedom will use the original port.
* ` userLevel `: Пользовательский уровень. Все подключения проходят через этот уровень.