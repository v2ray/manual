---
refcn: chapter_02/protocols/shadowsocks
refen: configuration/protocols/shadowsocks
---

# Shadowsocks

* 名称：`shadowsocks`
* 类型：入站 / 出站

[Shadowsocks](https://zh.wikipedia.org/wiki/Shadowsocks) 协议，包含入站和出站两部分，兼容大部分其它版本的实现。

与官方版本的兼容性：

* 支持 TCP 和 UDP 数据包转发，其中 UDP 可选择性关闭；
* 支持 [OTA](https://web.archive.org/web/20161221022225/https://shadowsocks.org/en/spec/one-time-auth.html)；
  * 客户端可选开启或关闭；
  * 服务器端可强制开启、关闭或自适应；
* 加密方式（其中 [AEAD](https://shadowsocks.org/en/spec/AEAD-Ciphers.html) 加密方式在 V2Ray 3.0 中加入）：
  * aes-256-cfb
  * aes-128-cfb
  * chacha20
  * chacha20-ietf
  * aes-256-gcm
  * aes-128-gcm
  * chacha20-poly1305 或称 chacha20-ietf-poly1305
* 插件：
  * 通过 Standalone 模式支持 obfs

Shadowsocks 的配置分为两部分，`InboundConfigurationObject`和`OutboundConfigurationObject`，分别对应入站和出站协议配置中的`settings`项。

## InboundConfigurationObject

```javascript
{
  "email": "love@v2ray.com",
  "method": "aes-128-cfb",
  "password": "密码",
  "level": 0,
  "ota": true,
  "network": "tcp"
}
```

> `email`: string

邮件地址，可选，用于标识用户

> `method`: string

必填。可选的值见[加密方式列表](#encryption-list)

> `password`: string

必填，任意字符串。Shadowsocks 协议不限制密码长度，但短密码会更可能被破解，建议使用 16 字符或更长的密码。

> `level`: number

用户等级，默认值为 `0`。详见[本地策略](../policy.md)。

> `ota`: true | false

是否强制 OTA，如果不指定此项，则自动判断。强制开启 OTA 后，V2Ray 会拒绝未启用 OTA 的连接。反之亦然。

当使用 AEAD 时，`ota` 设置无效

> `network`: "tcp" | "udp" | "tcp,udp"

可接收的网络连接类型，默认值为`"tcp"`。

## OutboundConfigurationObject

```javascript
{
  "servers": [
    {
      "email": "love@v2ray.com",
      "address": "127.0.0.1",
      "port": 1234,
      "method": "加密方式",
      "password": "密码",
      "ota": false,
      "level": 0
    }
  ]
}
```

> `servers`: \[[ServerObject](#serverobject)\]

一个数组，其中每一项是一个 [ServerObject](#serverobject)。

### ServerObject

```javascript
{
  "email": "love@v2ray.com",
  "address": "127.0.0.1",
  "port": 1234,
  "method": "加密方式",
  "password": "密码",
  "ota": false,
  "level": 0
}
```

> `email`: string

邮件地址，可选，用于标识用户

> `address`: address

Shadowsocks 服务器地址，支持 IPv4、IPv6 和域名。必填。

> `port`: number

Shadowsocks 服务器端口。必填。

> `method`: string

必填。可选的值见[加密方式列表](#encryption-list)

> `password`: string

必填。任意字符串。Shadowsocks 协议不限制密码长度，但短密码会更可能被破解，建议使用 16 字符或更长的密码。

> `ota`: true | false

是否开启 Shadowsocks 的一次验证（One time auth），默认值为`false`。

当使用 AEAD 时，`ota` 设置无效。

> `level`: number

用户等级

## 加密方式列表 {#encryption-list}

* `"aes-256-cfb"`
* `"aes-128-cfb"`
* `"chacha20"`
* `"chacha20-ietf"`
* `"aes-256-gcm"`
* `"aes-128-gcm"`
* `"chacha20-poly1305"` 或 `"chacha20-ietf-poly1305"`
