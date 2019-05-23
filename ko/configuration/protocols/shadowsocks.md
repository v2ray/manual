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
  * 에이스 -128-cfb
  * 차차 20
  * 차차 20-ietf
  * 에이스 -256-gcm
  * 에이스 -128-gcm
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

> `이메일`: 문자열

Email address. Used for user identification.

> `방법`: 문자열

Required. See [Encryption methods](#encryption-methods) for available values.

> `패스워드`: string

Required. Password in Shadowsocks protocol. Can be any string.

> `레벨`: 숫자

User level. Default to `0`. See [Policy](../policy.md).

> `오타`: `참` | `거짓`

Whether or not to force OTA. If `true` and the incoming connection doesn't enable OTA, V2Ray will reject this connection. Vice versa.

If this field is not specified, V2Ray auto detects OTA settings from incoming connections.

When AEAD encryption is used, `ota` has no effect.

> `네트워크`: "tcp"| "udp"| "tcp, udp"

지원되는 네트워크의 유형. `"tcp"로 기본값`.

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

어디에:

* `이메일`: 이메일 주소. 사용자 식별에 사용됩니다.
* `주소`: Shadowsocks 서버의 주소. IPv4, IPv6 또는 도메인이 될 수 있습니다.
* `포트`: Shadowsock 서버의 포트입니다.
* `방법`: 암호화 방법. 기본값이 없습니다. 옵션은 다음과 같습니다. 
  * `"aes-256-cfb"`
  * `"aes-128-cfb"`
  * `"차차 20"`
  * `"chacha20-ietf"`
  * `"aes-256-gcm"`
  * `"aes-128-gcm"`
  * `"chacha20-poly1305"` 또는 `"chacha20-ietf-poly1305"`
* `암호`: 암호. 임의의 문자열이 될 수 있습니다.
* `오타`: OTA 사용 여부. 
  * AEAD를 사용하면 `오타` 효과가 없습니다.
* `수준`: 사용자 수준입니다.

> `서버`: \ [[ServerObject](#serverobject)\]

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

> `이메일`: 문자열

Email address. Used for user identification.

> `주소`: 주소

필수 사항. Shadowsocks 서버 주소. IPv4, IPv6 또는 도메인 주소 일 수 있습니다.

> `포트`: 번호

필수 사항. Shadowsocks 서버 포트.

> `방법`: 문자열

필수 사항. 사용 가능한 값은 [암호화 방법](#encryption-methods) 을 참조하십시오.

> `패스워드`: string

필수 사항. Shadowsocks 프로토콜의 암호. 임의의 문자열이 될 수 있습니다.

> `오타`: 참 | 그릇된

OTA 사용 여부. 기본값은 `입니다. false`.

AEAD 암호화가 사용되면이 필드는 아무 효과가 없습니다.

> `레벨`: 숫자

사용자 수준.

## 암호화 방법

* `"aes-256-cfb"`
* `"aes-128-cfb"`
* `"차차 20"`
* `"chacha20-ietf"`
* `"aes-256-gcm"`
* `"aes-128-gcm"`
* `"chacha20-poly1305"` 또는 `"chacha20-ietf-poly1305"`