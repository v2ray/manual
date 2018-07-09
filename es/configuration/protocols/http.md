# HTTP

[![English](../resources/english.svg)](https://www.v2ray.com/en/configuration/protocols/http.html) [![Chinese](../resources/chinese.svg)](https://www.v2ray.com/chapter_02/protocols/http.html) [![German](../resources/german.svg)](https://www.v2ray.com/de/configuration/protocols/http.html) [![Russian](../resources/russian.svg)](https://www.v2ray.com/ru/configuration/protocols/http.html) [![Translate](../resources/lang.svg)](https://crowdin.com/project/v2ray)

HTTP is a protocol for inbound connections. It is compatible with HTTP 1.1.

* Name: http
* Type: Inbound
* Configuration:

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

Where:

* `accounts`: An array in which each entry is an account. Username of the account is specified by `user`, and password specified by `pass`. Default empty. 
  * If `accounts` is not empty, HTTP uses Basic Authentication for user verification.
* `allowTransparent`: If set to `true`, all HTTP request sent to this inbound will be proxied, including non-proxy request.
* `userLevel`: User level. All connections share this level.

## Tips

Use the following settings in Linux to use HTTP proxy in current session.

* `export http_proxy=http://127.0.0.1:8080/` (URL has to change according to your config)
* `export https_proxy=$http_proxy`