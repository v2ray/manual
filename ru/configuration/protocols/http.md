---
refcn: chapter_02/protocols/http
refen: configuration/protocols/http
---
# HTTP

HTTP is a protocol for inbound connections. It is compatible with HTTP 1.1.

* Название: http
* Тип: входящий
* Настройка:

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

* `accounts`: An array in which each entry is an account. Username of the account is specified by `user`, and password specified by `pass`. Default empty. 
  * Если значение `accounts` не пустое, HTTP использует базовую аутентификацию для подтверждения пользователя.
* ` allowTransparent `: Если установлено значение ` true `, все полученные HTTP-запросы, будут проксированы, включая запрос без прокси.
* `userLevel`: User level. All connections share this level.

## Советы

Используйте следующие настройки в Linux для использования прокси-сервера HTTP в текущем сеансе.

* `export http_proxy=http://127.0.0.1:8080/` (Адрес должен быть изменён на требуемый)
* `export https_proxy=$http_proxy`