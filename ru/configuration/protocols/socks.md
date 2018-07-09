# Socks

![English](../../resources/englishc.svg) [![Chinese](../../resources/chinese.svg)](https://www.v2ray.com/chapter_02/protocols/socks.html)

Socks - это реализация стандартного протокола SOCKS, совместимого с [ Socks 4 ](http://ftp.icm.edu.pl/packages/socks/socks4/SOCKS4.protocol), Socks 4а и [ Socks 5 ](http://ftp.icm.edu.pl/packages/socks/socks4/SOCKS4.protocol).

* Наименование: socks
* Тип: входящий / исходящий

## Конфигурация прокси для исходящего соединения

```javascript
{
  "servers": [{
    "address": "127.0.0.1",
    "port": 1234,
    "users": [
      {
        "user": "test user",
        "pass": "test pass",
        "level": 0
      }
    ]
  }]
}
```

Где:

* `servers`: Список socks серверов, в котором каждая запись это: 
  * `address`: Адрес сервера
  * `port`: Порт сервера
  * `users`: Список учетных записей пользователей: 
    * `user`: Логин
    * `pass`: Пароль
    * ` userLevel `: Пользовательский уровень.

Замечание:

* Если список пользователей не пустой, то socks будет использовать случайного пользователя для подключения к сервера.
* Поддерживаются только SOCKS5 сервера.

## Конфигурация прокси для входящего соединения

```javascript
{
  "auth": "noauth",
  "accounts": [
    {
      "user": "my-username",
      "pass": "my-password"
    }
  ],
  "udp": false,
  "ip": "127.0.0.1",
  "userLevel": 0
}
```

Где:

* `auth`: Метод аутентификации socks. Значение по умолчанию: `noauth`. Возможные варианты: 
  * `"noauth"`: Anonymous.
  * `"password"`: User and password [RFC 1929](https://tools.ietf.org/html/rfc1929)
* `accounts`: An array where each entry is contains `user` for username and `pass` for password. Default to empty. 
  * Only works when `auth` is `"password"`
* `udp`: `true` or `false` to enable UDP. Default to false.
* `ip`: When UDP is enabled, this IP address receives UDP packets from client. Default to `"127.0.0.1"`.
* `userLevel`: User level. All connections share this level.