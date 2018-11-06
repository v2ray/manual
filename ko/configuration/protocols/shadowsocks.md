---
refcn: chapter_02/protocols/shadowsocks
refen: configuration/protocols/shadowsocks
---
# Shadowsocks

* 이름 : `샤도우`
* 유형 : 인바운드 / 아웃 바운드

[Shadowsock](https://www.shadowsocks.org/) 프로토콜로 인바운드 및 아웃 바운드 연결에 사용됩니다.

공식 버전과의 호환성 :

* UDP를 선택적으로 해제 할 수있는 TCP 및 UDP 연결을 모두 지원합니다.
* 지원 [오타](https://web.archive.org/web/20161221022225/https://shadowsocks.org/en/spec/one-time-auth.html); 
  * 클라이언트는 켜거나 끌 수 있습니다.
  * 서버는 활성화, 비활성화 또는 자동을 선택할 수 있습니다.
* 암호화 방법 ([AEAD](https://shadowsocks.org/en/spec/AEAD-Ciphers.html) V2Ray 3.0에 추가 된 암호) : 
  * aes-256-cfb
  * 에이스 -128-cfb
  * 차차 20
  * 차차 20-ietf
  * 에이스 -256-gcm
  * 에이스 -128-gcm
  * chacha20-poly1305 일명 chacha20-ietf-poly1305
* 플러그인 : 
  * 스탠드 얼론 모드를 통해 obfs를 지원하십시오.

## InboundConfigurationObject

```javascript
"
  "이메일 : "love@v2ray.com",
  "method": "aes-128-cfb",
  "password": "password",
  "level": 0,
  "ota"
  "network": "tcp"
}
```

> `이메일`: 문자열

이메일 주소. 사용자 식별에 사용됩니다.

> `방법`: 문자열

필수 사항. 사용 가능한 값은 [암호화 방법](#encryption-methods) 을 참조하십시오.

> `패스워드`: string

필수 사항. Shadowsocks 프로토콜의 암호. 임의의 문자열이 될 수 있습니다.

> `레벨`: 숫자

사용자 수준. 기본값은 `0`입니다. [정책](../policy.md)참조하십시오.

> `오타`: `참` | `거짓`

오타를 강요할지 여부. `참` 이고 수신 연결이 OTA를 활성화하지 않으면 V2Ray는이 연결을 거부합니다. 그 반대입니다.

이 필드를 지정하지 않으면 V2Ray가 들어오는 연결에서 OTA 설정을 자동으로 감지합니다.

AEAD 암호화를 사용하면 `오타` 이 적용되지 않습니다.

> `네트워크`: "tcp"| "udp"| "tcp, udp"

지원되는 네트워크의 유형. `"tcp"로 기본값`.

## OutboundConfigurationObject

```javascript
{
  "서버": [
    {
      "이메일": "love@v2ray.com",
      "주소": "127.0.0.1",
      "포트": 1234,
      "방법": "방법",
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

[ServerObject](#serverobject)배열입니다.

### ServerObject

```javascript
{
  "email": "love@v2ray.com",
  "address": "127.0.0.1",
  "port": 1234,
  "method": "加密 방식",
  "password": "密码" ,
  "ota": false,
  "level": 0
}
```

> `이메일`: 문자열

이메일 주소. 사용자 식별에 사용됩니다.

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