---
refcn: chapter_02/protocols/vmess
refen: configuration/protocols/vmess
---

# VMess

* 이름 : `vmess`
* 유형 : 인바운드 / 아웃 바운드

[VMess](https://www.v2ray.com/eng/protocols/vmess.html) 은 암호화 된 통신을위한 프로토콜입니다. 여기에는 인바운드 및 아웃 바운드 프록시가 모두 포함됩니다.

VMess는 시스템 시간에 의존합니다. 시스템 시간이 UTC 시간과 일치하는지 확인하십시오. 시간대는 중요하지 않습니다. 시스템 시간을 자동으로 조정하기 위해 Linux에 `ntp` 서비스를 설치할 수 있습니다.

## OutboundConfigurationObject

```javascript
{
  "vnext": [
    {
      "address": "127.0.0.1",
      "port": 37192,
      "users": [
        {
          "id": "27848739-7e62-4138-9fd3-098a63964b6b",
          "alterId": 4,
          "security": "auto",
          "level": 0
        }
      ]
    }
  ]
}
```

> `vnext`: \ [ [ServerObject](#serverobject)\]

각 요소가 원격 서버를 제공하는 배열

### ServerObject

```javascript
{
  "address": "127.0.0.1",
  "port": 37192,
  "users": []
}
```

> `주소`: 주소

서버 주소는 IPv4, IPv6 또는 도메인 이름 일 수 있습니다.

> `포트`: 번호

서버 포트

> `명의 사용자`: \ [ [UserObject](#userobject)\]

각 요소가 VMess 사용자 인 배열

### UserObject

```javascript
{
  "id": "27848739-7e62-4138-9fd3-098a63964b6b",
  "alterId": 16,
  "security": "auto",
  "level": 0
}
```

> `id`: 문자열

사용자 ID,의 형태로 [UUID](https://en.wikipedia.org/wiki/Universally_unique_identifier).

> `alterId`: 숫자

Number of alternative IDs. The alternative IDs will be generated in a deterministic way. Default to 0. Maximum 65535. Recommend 4. Its value must be not larger than the one in corresponding Inbound.

> `레벨`: 숫자

사용자 수준. 자세한 내용은 [정책](../policy.md) 을 참조하십시오.

> `보안`: "aes-128-gcm"| "chacha20-poly1305"| "자동"| "없음"

페이로드를 암호화하는 방법. 이 설정은 아웃 바운드에서만 사용할 수 있습니다. VMess 인바운드는 자동으로이 설정을 인식하고 이에 따라 페이로드를 해독합니다. 옵션은 다음과 같습니다.

* `"aes-128-gcm"`: PC의 경우 권장됩니다.
* `"chacha20-poly1305"`: 모바일 용으로 권장됩니다.
* `"auto"`: 기본값. 사용 `AES-128-GCM` AMD64, ARM64 및 s390x가, 또는에 `chacha20-poly1305` 그렇지.
* `"없음"`: 트래픽이 전혀 암호화되지 않습니다.

{% hint style='info' %}

Use `"auto"` wherever possible for better compatibility.

{% endhint %}

## InboundConfigurationObject

```javascript
{
  "clients": [
    {
      "id": "27848739-7e62-4138-9fd3-098a63964b6b",
      "level": 0,
      "alterId": 4,
      "email": "love@v2ray.com"
    }
  ],
  "default": {
    "level": 0,
    "alterId": 4
  },
  "detour": {
    "to": "tag_to_detour"
  },
  "disableInsecureEncryption": false
}
```

> `클라이언트`: \ [ [ClientObject](#clientobject)\]

An array for valid user accounts. May be empty when used for dynamic port feature.

> `detour`: [DetourObject](#detourobject)

Optional feature to suggest client to take a detour. If specified, this inbound will instruct the outbound to use another inbound.

> `기본값`: [DefaultObject](#defaultobject)

Optional default client configuration. Usually used with `detour`.

> `disableInsecureEncryption`: true | 그릇된

Forbids client for using insecure encryption methods. When set to `true`, connections will be terminated immediately if the following encryption is used. Default value `false`.

* `없음`
* `에이스 -128-cfb`

### ClientObject

```javascript
{
  "id": "27848739-7e62-4138-9fd3-098a63964b6b",
  "level": 0,
  "alterId": 4,
  "email": "love@v2ray.com"
}
```

> `id`: 문자열

User ID, in the form of [UUID](https://en.wikipedia.org/wiki/Universally_unique_identifier).

> `레벨`: 숫자

User level. See [Policy](../policy.md) for its usage.

> `alterId`: 숫자

Number of alternative IDs. Same as in Outbound.

> `이메일`: 문자열

Email address for user identification.

### DetourObject

```javascript
{
  "to": "tag_to_detour"
}
```

> `~`: 문자열

The tag of an inbound proxy. See [Overview](../protocols.md). If configured, VMess will suggest its client to use the detour for further connections.

### DefaultObject

```javascript
{
  "level": 0,
  "alterId": 4
}
```

> `레벨`: 숫자

User level.

> `alterId`: 숫자

Number of alternative IDs. Default value 64. Recommend 4.