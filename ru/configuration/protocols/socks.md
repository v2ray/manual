---
refcn: chapter_02/protocols/socks
refen: configuration/protocols/socks
---

# Socks

* Название: `socks`
* Тип: входящий / исходящий

Socks - это реализация стандартного протокола SOCKS, совместимого с [ Socks 4 ](http://ftp.icm.edu.pl/packages/socks/socks4/SOCKS4.protocol), Socks 4а и [ Socks 5 ](http://ftp.icm.edu.pl/packages/socks/socks4/SOCKS4.protocol).

Socks configuration consists of two parts, `InboundConfigurationObject` and `OutboundConfigurationObject`, for inbound and outbound respectively.

## OutboundConfigurationObject

`OutboundConfigurationObject` is used as `settings` field in `OutboundObject` in top level configuration.

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

> `servers`: \[ [ServerObject](#serverobject) \]

Массив Socks-серверов.

### ServerObject

```javascript
{
  "address": "127.0.0.1",
  "port": 1234,
  "users": [
    {
      "user": "test user",
      "pass": "test pass",
      "level": 0
    }
  ]
}
```

> `address`: address

Адрес сервера. Может быть адресом IPv4, IPv6 или доменным именем.

{% hint style='info' %}

Поддерживаются только Socks 5 сервера.

{% endhint %}

> `port`: number

Порт Socks-сервера.

> `users`: \[ [UserObject](#userobject) \]

An array of users. Each element in the array is an user. If the list is not empty. Socks inbound will force user authentication. Otherwise, anonymous user is allowed.

### UserObject

```javascript
{
  "user": "test user",
  "pass": "test pass",
  "level": 0
}
```

> `user`: string

Username as in Socks protocol

> `pass`: string

Password as in Socks protocol

> `level`: number

User level for tracking and policy purpose. Default value is `0`.

## InboundConfigurationObject

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

> `auth`: "noauth" | "password"

Socks autentication method. `"noauth"` is for anonymous authentication, and `"password"` for authentication with username and password. Default value is `"noauth"`.

> `accounts`: \[ [AccountObject](#accountobject) \]

An array of user accounts, for authenication purpose. Only take effect when `auth` is set to `"password"`.

> `udp`: true | false

Whether or not to enable UDP. Default value is `false`.

> `ip`: address

When UDP is enabled, V2Ray needs to know the IP address of current host. Default value is `"127.0.0.1"`. This must be set to the public IP address of the host, if you want to allow public UDP traffic.

> `userLevel`: number

User level. All incoming connections share this user level.

### AccountObject

```javascript
{
  "user": "my-username",
  "pass": "my-password"
}
```

> `user`: string

Username as in Socks protocol

> `pass`: string

Password as in Socks protocol