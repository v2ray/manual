---
refcn: chapter_02/protocols/shadowsocks
refen: configuration/protocols/shadowsocks
---

# Shadowsocks

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

协议描述：

* 名称：shadowsocks
* 类型：Inbound / Outbound

## 入站协议配置 {#inbound}

```javascript
{
  "email": "love@v2ray.com",
  "method": "aes-128-cfb",
  "password": "密码",
  "udp": false,
  "level": 0,
  "ota": true,
  "network": "tcp"
}
```

其中：

* `email`: 邮箱地址，用于标识用户；
* `method`: 加密方式，没有默认值。可选的值有：
  * `"aes-256-cfb"`
  * `"aes-128-cfb"`
  * `"chacha20"`
  * `"chacha20-ietf"`
  * `"aes-256-gcm"`
  * `"aes-128-gcm"`
  * `"chacha20-poly1305"` 或 `"chacha20-ietf-poly1305"`
* `password`: 密码，任意字符串。Shadowsocks 协议不限制密码长度，但短密码会更可能被破解，建议使用 16 字符或更长的密码。
* `udp` (已过时，使用`network`替代): `true` / `false`，是否开启 UDP 转发，默认值为 `false`。
* `level`: 用户等级，默认值为 `0`。如果是自用的 VPS，可以设成 `1`。详见[本地策略](../policy.md)。
* `ota`: `true` / `false`，是否强制 OTA，默认模式为自动，当指定了 `true` / `false` 时，则为强制不启用或启用。
  * 当使用 AEAD 时，`ota` 设置无效
* `network` (V2Ray 3.16+): 指定服务器的网络协议类型，可选值为`“tcp”`或`“udp”`或`"tcp,udp"`。默认值为`"tcp"`。

## 出站协议配置 {#outbound}

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

其中：

* `email`: 邮箱地址，用于标识用户；
* `address`: Shadowsocks 服务器地址，支持 IPv4、IPv6 和域名。
* `port`: 服务器端口。
* `method`: 加密方式，没有默认值。可选的值有：
  * `"aes-256-cfb"`
  * `"aes-128-cfb"`
  * `"chacha20"`
  * `"chacha20-ietf"`
  * `"aes-256-gcm"` (V2Ray 3.0+)
  * `"aes-128-gcm"` (V2Ray 3.0+)
  * `"chacha20-poly1305"` 或 `"chacha20-ietf-poly1305"` (V2Ray 3.0+)
* `password`: 密码，任意字符串。Shadowsocks 协议不限制密码长度，但短密码会更可能被破解，建议使用 16 字符或更长的密码。
* `ota`: 是否开启 Shadowsocks 的一次验证（One time auth）。
  * 当使用 AEAD 时，`ota` 设置无效
* `level`: 用户等级
