---
refcn: chapter_02/transport/quic
refen: configuration/transport/quic
---

# QUIC

QUIC, or Quick UDP Internet Connection, is a multiplexing transport based on UDP, initially designed, implemented, and deployed by Google.

QUIC has the following advantages:

1. Reduced number of roundtrips in handshake phase. (1-RTT or 0-RTT)
2. Multiplexing without head of line blocking as in TCP
3. Connection migration, especially for clients. For example, connections don't break when device moves from Wi-Fi to 4G.

QUIC is now an experiment in V2Ray. It implements IETF specification. As the spec is still being standardized, compatibility can't be guaranteed.

## Update History

V2Ray 4.7:

* Initial version to support QUIC.
* Default settings: 
  * 12 byte Connection ID
  * Connection timeout in 30 seconds if no data traffic. (May have impact on some long HTTP connections)

## QuicObject

QUIC is used as `quicSettings` in transport settings. The configuration must be exactly the same between connecting peers.

QUIC requires TLS. If TLS is not enabled in transport settings, V2Ray will automatically issue a TLS certificate for it. When QUIC transport is used, encryption in VMess can be turned off.

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

Extra encryption over entire QUIC packet, include the frame head part. Default value is "none" for no encryption. After being encrypted, QUIC packets can't be sniff'ed.

> `key`: string

Key for the encryption above. Can be any string. Only effective when `security` is not `"none"`.

> `header`: [HeaderObject](#headerobject)

Configuration for packet header obfuscation.

### HeaderObject

```javascript
{
  "type": "none"
}
```

> `type`: string

Type of obfuscation. Corresponding inbound and outbound proxy must have the same settings. Choices are:

* `"none"`: Default value. No obfuscation is used.
* `"srtp"`: Obfuscated as SRTP traffic. It may be recognized as video calls such as Facetime.
* `"utp"`: Obfuscated as uTP traffic. It may be recognized as Bittorrent traffic.
* `"wechat-video"`: Obfuscated to WeChat traffic.
* `"dtls"`: Obfuscated as DTLS 1.2 packets.
* `"wireguard"`: Obfuscated as WireGuard packets. (NOT true WireGuard protocol)

{% hint style='info' %} When neither encryption nor obfuscation is enabled, QUIC transport is compatible with other QUIC tools. However it is recommended to enable either or both for better undetectable communication. {% endhint %}