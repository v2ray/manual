# Socks

Socks 是一个传入数据协议，兼容 [Socks 4](http://ftp.icm.edu.pl/packages/socks/socks4/SOCKS4.protocol) 和 [Socks 5](http://ftp.icm.edu.pl/packages/socks/socks4/SOCKS4.protocol)，暂不支持 Socks 4a。

* 名称：socks
* 类型：Inbound
* 配置：

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
  "timeout": 0
}
```

其中：

* `auth`: Socks 协议的认证方式，支持`"noauth"`匿名方式和`"password"`用户密码方式。默认值为`"noauth"`。
* `acounts`: 一个数组，数组中每个元素为一个用户帐号，用户名由`user`指定，密码由`pass`指定。默认值为空。
  * 当 `auth` 为 `password` 时有效。
* `udp`: 是否开启 UDP 协议的支持，`true` / `false`。默认值为 `false`。
* `ip`: 当开启 UDP 时，V2Ray 需要知道本机的 IP 地址。默认值为 127.0.0.1。
* `timeout`: 从 Socks 客户端读取数据的超时设置（秒），0 表示不限时。默认值为 `0`。
