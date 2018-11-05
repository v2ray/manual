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
          "alterId": 16,
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
  "주소": "127.0.0.1",
  "포트": 37192,
  "사용자": []
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
  "보안": "자동",
  "레벨": 0
}
```

> `id`: 문자열

사용자 ID,의 형태로 [UUID](https://en.wikipedia.org/wiki/Universally_unique_identifier).

> `alterId`: 숫자

대체 ID의 수. 대체 ID는 결정적 방식으로 생성됩니다. 기본값은 0입니다. 최대 65535입니다. 권장 사항 16. 값은 해당 인바운드의 값보다 커야합니다.

> `레벨`: 숫자

사용자 수준. 자세한 내용은 [정책](../policy.md) 을 참조하십시오.

> `보안`: "aes-128-gcm"| "chacha20-poly1305"| "자동"| "없음"

페이로드를 암호화하는 방법. 이 설정은 아웃 바운드에서만 사용할 수 있습니다. VMess 인바운드는 자동으로이 설정을 인식하고 이에 따라 페이로드를 해독합니다. 옵션은 다음과 같습니다.

* `"aes-128-gcm"`: PC의 경우 권장됩니다.
* `"chacha20-poly1305"`: 모바일 용으로 권장됩니다.
* `"auto"`: 기본값. 사용 `AES-128-GCM` AMD64, ARM64 및 s390x가, 또는에 `chacha20-poly1305` 그렇지.
* `"없음"`: 트래픽이 전혀 암호화되지 않습니다.

{% hint style = 'info'%} 보다 나은 호환성을 위해 가능하면 `"auto"` 사용하십시오. {% endhint %}

## InboundConfigurationObject

```javascript
{
  "clients": [
    {
      "id": "27848739-7e62-4138-9fd3-098a63964b6b",
      "level": 0,
      "alterId": 100,
      "email": "love @ v2ray. COM "
    }
  ,
  "기본 "{
    "레벨 "0,
    "alterId "32
  },
  "우회 "{
    "를 ""tag_to_detour "
  }
  "disableInsecureEncryption " : 거짓
}
```

> `클라이언트`: \ [ [ClientObject](#clientobject)\]

유효한 사용자 계정을위한 배열. 동적 포트 기능으로 사용될 때 비어있을 수 있습니다.

> `detour`: [DetourObject](#detourobject)

선택 기능으로 클라이언트에게 우회를 제안 할 수 있습니다. 이 인바운드가 지정되면 아웃 바운드가 다른 인바운드를 사용하도록 지시합니다.

> `기본값`: [DefaultObject](#defaultobject)

선택적 기본 클라이언트 구성. 일반적으로 `우회로와 함께 사용됩니다`.

> `disableInsecureEncryption`: true | 그릇된

클라이언트가 안전하지 않은 암호화 방법을 사용하는 것을 금지합니다. 로 설정하면 `에 해당`다음 암호화가 사용된다면, 연결은 즉시 종결된다. 기본값 `false`.

* `없음`
* `에이스 -128-cfb`

### ClientObject

```javascript
{
  "id": "27848739-7e62-4138-9fd3-098a63964b6b",
  "level": 0,
  "alterId": 16,
  "email": "love@v2ray.com"
}
```

> `id`: 문자열

[UUID 형식의 사용자 ID](https://en.wikipedia.org/wiki/Universally_unique_identifier).

> `레벨`: 숫자

사용자 수준. 사용법은 [정책](../policy.md) 을 참조하십시오.

> `alterId`: 숫자

대체 ID의 수. 아웃 바운드와 동일합니다.

> `이메일`: 문자열

사용자 식별을위한 이메일 주소.

### DetourObject

```javascript
{
  "~": "tag_to_detour"
}
```

> `~`: 문자열

인바운드 프록시의 태그. [개요](../protocols.md)참조하십시오. 구성된 경우 VMess는 추가 연결을 위해 우회 경로를 사용할 클라이언트를 제안합니다.

### DefaultObject

```javascript
{
  "레벨": 0,
  "alterId": 32
}
```

> `레벨`: 숫자

사용자 수준.

> `alterId`: 숫자

대체 ID의 수. 기본값은 64입니다.