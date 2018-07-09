# HTTP

![English](../../resources/englishc.svg) [![Chinese](../../resources/chinese.svg)](https://www.v2ray.com/chapter_02/protocols/http.html)

HTTP - это протокол для входящих соединений. Он совместим с HTTP 1.1.

* Название: http
* Тип: входящий
* Конфигурация:

```javascript
{
  "accounts": [
    {
      "user": "my-username",
      "pass": "my-password"
    }
  ],
  "allowTransparent": false,
  "userLevel": 0
}
```

Где:

* `accounts`: Массив, в котором каждая запись является учетной записью. Имя пользователя указывается через `user`, а пароль через `pass`. Значения по умолчанию пустые. 
  * Если значение `accounts` не пустое, HTTP использует базовую аутентификацию для подтверждения пользователя.
* `allowTransparent`: If set to `true`, all HTTP request sent to this inbound will be proxied, including non-proxy request.
* `userLevel`: User level. All connections share this level.

## Tips

Use the following settings in Linux to use HTTP proxy in current session.

* `export http_proxy=http://127.0.0.1:8080/` (URL has to change according to your config)
* `export https_proxy=$http_proxy`