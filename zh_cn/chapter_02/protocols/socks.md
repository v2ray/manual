# Socks

标准 Socks 协议实现，兼容 [Socks 4](http://ftp.icm.edu.pl/packages/socks/socks4/SOCKS4.protocol)、Socks 4a 和 [Socks 5](http://ftp.icm.edu.pl/packages/socks/socks4/SOCKS4.protocol)。

* 名称：socks
* 类型：Inbound / Outbound

## Socks 传出协议配置

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

其中：

* `servers`: Socks 服务器列表，其中每一项为：
  * `address`: 服务器地址
  * `port`: 服务器端口
  * `users`: 用户列表，其中每一项为：
    * `user`: 用户名
    * `pass`: 密码
    * `level`: 用户等级

注意：

* 当一个服务器指定了用户时，Socks 客户端会使用此用户信息进行认证；如未指定，则不进行认证。
* 仅支持连接到 Socks 5 服务器。

## Socks 传入协议配置

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
  "timeout": 0,
  "userLevel": 0
}
```

其中：

* `auth`: Socks 协议的认证方式，支持`"noauth"`匿名方式和`"password"`用户密码方式。默认值为`"noauth"`。
* `accounts`: 一个数组，数组中每个元素为一个用户帐号，用户名由`user`指定，密码由`pass`指定。默认值为空。
  * 当 `auth` 为 `password` 时有效。
* `udp`: 是否开启 UDP 协议的支持，`true` / `false`。默认值为 `false`。
* `ip`: 当开启 UDP 时，V2Ray 需要知道本机的 IP 地址。默认值为 127.0.0.1。
* `timeout` (V2Ray 3.1 后等价于对应用户等级的 `connIdle` 策略): 从 Socks 客户端读取数据的超时设置（秒），0 表示不限时。默认值为 `300`。
* `userLevel`: 用户等级，所有连接使用这一等级。
