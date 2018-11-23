---
refcn: chapter_02/transport/quic
refen: configuration/transport/quic
---

# QUIC 传输方式

QUIC 全称 Quick UDP Internet Connection，是由 Google 提出的使用 UDP 进行多路并发传输的协议。其主要优势是:

1. 减少了握手的延迟（1-RTT 或 0-RTT）
1. 多路复用，并且没有 TCP 的阻塞问题
1. 连接迁移，（主要是在客户端）当由 Wifi 转移到 4G 时，连接不会被断开。

QUIC 目前处于实验期，使用了正在标准化过程中的 IETF 实现，不能保证与最终版本的兼容性。

## 版本历史

V2Ray 4.7:

* 开始支持 QUIC。
* 对接的两个 IP 之间的并发连接数不能超过 256。超过之后新连接会被挂起，直到连接数小于 256 时。可以开启 [Mux](../mux.md) 以缓解这一问题。

## QuicObject

QUIC 的配置对应传输配置中的 `quicSettings` 项。对接的两端的配置必须完全一致，否则连接失败。QUIC 强制要求开启 TLS，在传输配置中没有开启 TLS 时，V2Ray 会自行签发一个证书进行 TLS 通讯。在使用 QUIC 传输时，可以关闭 VMess 的加密。

```javascript
{
  "security": "none",
  "key": "",
  "header": {
    "type": "none"
  }
}
```

> `security`: "none" | "aes-128-gcm" | "chacha20-poly1305"

加密方式。默认值为不加密。

此加密是对 QUIC 数据包的加密，加密后数据包无法被探测。

> `key`: string

加密时所用的密钥。可以是任意字符串。当`security`不为`"none"`时有效。

> `header`: [HeaderObject](#headerobject)

数据包头部伪装设置

### HeaderObject

```javascript
{
  "type": "none"
}
```

> `type`: string

伪装类型，可选的值有：

* `"none"`: 默认值，不进行伪装，发送的数据是没有特征的数据包。
* `"srtp"`: 伪装成 SRTP 数据包，会被识别为视频通话数据（如 FaceTime）。
* `"utp"`: 伪装成 uTP 数据包，会被识别为 BT 下载数据。
* `"wechat-video"`: 伪装成微信视频通话的数据包。
* `"dtls"`: 伪装成 DTLS 1.2 数据包。
* `"wireguard"`: 伪装成 WireGuard 数据包。(并不是真正的 WireGuard 协议)

{% hint style='info' %}
当加密和伪装都不启用时，数据包即为原始的 QUIC 数据包，可以与其它的 QUIC 工具对接。为了避免被探测，建议加密或伪装至少开启一项。
{% endhint %}
