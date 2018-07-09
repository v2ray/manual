# Freedom

![English](../../resources/englishc.svg) [![Chinese](../../resources/chinese.svg)](https://www.v2ray.com/chapter_02/protocols/freedom.html)

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
  * `"UseIP"`: Use [internal DNS](../dns.md) for domain name resolution.
* `redirect`: Redirect all connections to this address, in form like `"127.0.0.1:80"` or `":1234"`.
* `userLevel`: User level. All connections share this level.