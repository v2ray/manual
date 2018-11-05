---
refcn: chapter_02/protocols/shadowsocks
refen: configuration/protocols/shadowsocks
---
# Shadowsocks

* Name: `shadowsocks`
* Type: Inbound / Outbound

[Shadowsocks](https://www.shadowsocks.org/) protocol, for both inbound and outbound connections.

Compatibility with official version:

* Supports both TCP and UDP connections, where UDP can be optional turned off.
* Supports [OTA](https://web.archive.org/web/20161221022225/https://shadowsocks.org/en/spec/one-time-auth.html)； 
  * Client may choose to turn on or off.
  * Server may choose to enable, disable or auto.
* Encryption methods ([AEAD](https://shadowsocks.org/en/spec/AEAD-Ciphers.html) ciphers added in V2Ray 3.0): 
  * aes-256-cfb
  * aes-128-cfb
  * chacha20
  * chacha20-ietf
  * aes-256-gcm
  * aes-128-gcm
  * chacha20-poly1305 a.k.a. chacha20-ietf-poly1305
* Plugins： 
  * Support obfs through standalone mode.

## InboundConfigurationObject

```javascript
{
  "email": "love@v2ray.com",
  "method": "aes-128-cfb",
  "password": "password",
  "level": 0,
  "ota": true,
  "network": "tcp"
}
```

> `email`: string

Email address. Used for user identification.

> `method`: string

Required. See [Encryption methods](#encryption-methods) for available values.

> `password`: string

Required. Password in Shadowsocks protocol. Can be any string.

> `level`: number

User level. Default to `0`. See [Policy](../policy.md).

> `ota`: `true` | `false`

Whether or not to force OTA. If `true` and the incoming connection doesn't enable OTA, V2Ray will reject this connection. Vice versa.

If this field is not specified, V2Ray auto detects OTA settings from incoming connections.

When AEAD encryption is used, `ota` has no effect.

> `network`: "tcp" | "udp" | "tcp,udp"

Type of supported networks. Default to `"tcp"`.

## OutboundConfigurationObject

```javascript
{
  "servers": [
    {
      "email": "love@v2ray.com",
      "address": "127.0.0.1",
      "port": 1234,
      "method": "method",
      "password": "password",
      "ota": false,
      "level": 0
    }
  ]
}
```

Where:

* `email`: Email address. Used for user identification.
* `address`: Address of Shadowsocks server. Can be IPv4, IPv6 or domain.
* `port`: Port of Shadowsocks server.
* `method`: Encryption method. No default value. Options are: 
  * `"aes-256-cfb"`
  * `"aes-128-cfb"`
  * `"chacha20"`
  * `"chacha20-ietf"`
  * `"aes-256-gcm"`
  * `"aes-128-gcm"`
  * `"chacha20-poly1305"` or `"chacha20-ietf-poly1305"`
* `password`: Password. Can be any string.
* `ota`: Whether or not to use OTA. 
  * When AEAD is used, `ota` has no effect.
* `level`: User level.

> `servers`: \[[ServerObject](#serverobject)\]

An array of [ServerObject](#serverobject)s.

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

Email address. Used for user identification.

> `address`: address

Required. Shadowsocks server address. May be IPv4, IPv6 or domain address.

> `port`: number

Required. Shadowsocks server port.

> `method`: string

Required. See [Encryption methods](#encryption-methods) for available values.

> `password`: string

Required. Password in Shadowsocks protocol. Can be any string.

> `ota`: true | false

Whether or not to use OTA. Default value is `false`.

When AEAD encryption is used, this field has no effect.

> `level`: number

User level.

## Encryption methods

* `"aes-256-cfb"`
* `"aes-128-cfb"`
* `"chacha20"`
* `"chacha20-ietf"`
* `"aes-256-gcm"`
* `"aes-128-gcm"`
* `"chacha20-poly1305"` or `"chacha20-ietf-poly1305"`