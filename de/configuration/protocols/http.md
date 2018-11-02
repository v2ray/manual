---
refcn: chapter_02/protocols/http
refen: configuration/protocols/http
---
# HTTP

* Name: `http`
* Type: Inbound

HTTP is a protocol for inbound connections. It is compatible with HTTP/1.1.

## InboundConfigurationObject

```javascript
{"accounts": [{"user": "mein-Benutzername", "pass": "mein-Passwort"}], "allowTransparent": false, "userLevel": 0}
```

> `accounts`: \[[AccountObject](#accountobject)\]

An array in which each entry is an account. It is empty by default. If not empty, HTTP Basic Authentication is required for incoming requests.

> `allowTransparent`: true | false

If set to `true`, all HTTP request sent to this inbound will be proxied, including non-proxy request.

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

{% hint style='info' %} Use the following settings in Linux to use HTTP proxy in current session.

* `export http_proxy=http://127.0.0.1:8080/` (URL has to change according to your config)
* `export https_proxy=$http_proxy`

{% endhint %}