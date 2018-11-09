---
refcn: chapter_02/protocols/http
refen: configuration/protocols/http
---
# HTTP

* Name: `http`
* Тип: входящий

HTTP is a protocol for inbound connections. It is compatible with HTTP/1.1.

## InboundConfigurationObject

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

> `accounts`: \[[AccountObject](#accountobject)\]

An array in which each entry is an account. It is empty by default. If not empty, HTTP Basic Authentication is required for incoming requests.

> `allowTransparent`: true | false

Если установлено значение `true`, все полученные HTTP-запросы, будут проксированы, включая запрос без прокси.

> `userLevel`: number

User level. All connections share this level.

### AccountObject

```javascript
{
  "user": "my-username",
  "pass": "my-password"
}
```

> `user`: string

Username for HTTP authentication.

> `pass`: string

password for HTTP authentication.

{% hint style='info' %}

Используйте следующие настройки в Linux для использования прокси-сервера HTTP в текущем сеансе.

* `export http_proxy=http://127.0.0.1:8080/` (Адрес должен быть изменён на требуемый)
* `export https_proxy=$http_proxy`

{% endhint %}