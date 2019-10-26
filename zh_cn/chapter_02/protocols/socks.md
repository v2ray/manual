---
refcn: chapter_02/protocols/socks
refen: configuration/protocols/socks
---

# Socks

* 名称：`socks`
* 类型：入站 / 出站

标准 Socks 协议实现，兼容 [Socks 4](http://ftp.icm.edu.pl/packages/socks/socks4/SOCKS4.protocol)、Socks 4a 和 [Socks 5](http://ftp.icm.edu.pl/packages/socks/socks4/SOCKS4.protocol)。

Socks 的配置分为两部分，`InboundConfigurationObject`和`OutboundConfigurationObject`，分别对应入站和出站协议配置中的`settings`项。

## OutboundConfigurationObject

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

应该注意，虽然socks outbound可以作为对外访问的配置，但socks协议没有对传输加密，不适宜经公网中传输。socks outbound 更有意义的用法是在特殊情况下，只能使用socks proxy对外访问内部网络中，作为为其他协议连接代理服务器的前置代理使用（见`OutboundObject`的`ProxySettingsObject`）。

> `servers`: \[ [ServerObject](#serverobject) \]

Socks 服务器列表，其中每一项是一个服务器配置。

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

服务器地址。

{% hint style='info' %}
仅支持连接到 Socks 5 服务器。
{% endhint %}

> `port`: number

服务器端口

> `users`: \[ [UserObject](#userobject) \]

用户列表，其中每一项一个用户配置。当列表不为空时，Socks 客户端会使用此用户信息进行认证；如未指定，则不进行认证。

### UserObject

```javascript
{
  "user": "test user",
  "pass": "test pass",
  "level": 0
}
```

> `user`: string

用户名

> `pass`: string

密码

> `level`: number

用户等级

## InboundConfigurationObject

应该注意，虽然socks inbound可以公共服务端口，但socks协议没有对传输加密，不适宜经公网中传输。socks inbound更有意义的用法是在局域网或本机环境下，为其他程序提供本地服务。

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

Socks 协议的认证方式，支持`"noauth"`匿名方式和`"password"`用户密码方式。默认值为`"noauth"`。

> `accounts`: \[ [AccountObject](#accountobject) \]

一个数组，数组中每个元素为一个用户帐号。默认值为空。此选项仅当 `auth` 为 `password` 时有效。

> `udp`: true | false

是否开启 UDP 协议的支持。默认值为 `false`。

> `ip`: address

当开启 UDP 时，V2Ray 需要知道本机的 IP 地址。默认值为`"127.0.0.1"`。

> `userLevel`: number

用户等级，所有连接使用这一等级。

### AccountObject

```javascript
{
  "user": "my-username",
  "pass": "my-password"
}
```

> `user`: string

用户名

> `pass`: string

密码
