---
refcn: chapter_02/04_dns
refen: configuration/dns
---
# DNS

V2Ray에는 다른 구성 요소에 대한 DNS 릴레이를 제공하는 내부 DNS 서버가 있습니다.

{% hint style = 'info'%} DNS 프로토콜의 복잡성 때문에 V2Ray는 이제 기본 IP 쿼리 (A 및 AAAA) 만 지원합니다. V2Ray에는 전문적인 DNS 의존 (예 : [CoreDNS](https://coredns.io/))을 사용하는 것이 좋습니다. {% endhint %}

이 DNS 서비스에서 중계 된 DNS 쿼리는 라우팅 설정을 기반으로 발송됩니다. 추가 구성이 필요하지 않습니다.

## DnsObject

`DnsObject` 은 최상위 레벨 구성에서 `dns` 필드로 사용됩니다.

```javascript
{
  "hosts": {
    "baidu.com": "127.0.0.1"
  },
  "servers": [
    {
      "address": "1.2.3.4",
      "port": 5353,
      "domains": [
        "domain:v2ray.com"
      ],
    },
    "8.8.8.8",
    "8.8.4.4",
    "localhost"
  ],
  "clientIp": "1.2.3.4"
}
```

> `호스트`:지도{string: address}

고정 IP 주소의 목록. 각 항목에는 도메인 이름이 키로, IP 주소가 값으로 있습니다. DNS 쿼리가이 목록의 도메인 중 하나를 대상으로하는 경우 해당 IP가 즉시 반환되고 DNS 쿼리는 릴레이되지 않습니다.

도메인의 형식은 다음과 같습니다.

* `"v2ray.com"`: 해결할 도메인이이 도메인과 같아야합니다.
* `"domain : v2ray.com"`: 해결할 도메인은이 도메인 또는 그 하위 도메인이 될 수 있습니다.

> `서버`: \ [string | [ServerObject](#serverobject) | "localhost"\]

DNS 서버 목록. 각 서버는 세 가지 형식으로 지정할 수 있습니다 : IP 주소, [ServerObject]를](#serverobject)또는 `"로컬 호스트"`.

서버가 `"8.8.8.8"`과 같은 IP 주소 인 경우 V2Ray는이 주소의 UDP 포트 53에서 DNS를 쿼리합니다.

서버가 `"localhost"`, V2Ray가 로컬 호스트에 DNS를 쿼리합니다.

{% hint style = 'info'%} `"localhost"` 가 사용될 때, 나가는 DNS 트래픽은 V2Ray에 의해 제어되지 않습니다. 그러나 추가 구성을 사용하여 DNS 쿼리를 다시 V2Ray로 리디렉션 할 수 있습니다. {% endhint %}

> `clientIp`: string

현재 기계의 IP 주소. 지정된 경우 V2Ray는이 IP를 EDNS-Client-Subnet으로 사용합니다. 이 IP는 개인 주소가 될 수 없습니다.

### ServerObject

```javascript
{
  "주소": "1.2.3.4",
  "포트": 5353,
  "도메인": [
    "도메인 : v2ray.com"
  ],
}
```

> `주소`: 주소

DNS 서버의 주소. 현재로서는 UDP 서버 만 지원됩니다.

> `포트`: 번호

DNS 서버의 포트. 보통 `53` 또는 `5353`입니다.

> `도메인`: \ [string \]

도메인 목록. inquire 도메인이 목록 중 하나와 일치하면이 DNS 서버는이 도메인에 대한 DNS 쿼리에 우선 순위가 지정됩니다.

도메인 이름 형식은 [라우팅](routing.md)과 동일합니다.

DNS 서버의 도메인 목록에 도메인이 있으면이 서버에서 먼저 도메인을 쿼리 한 다음 다른 서버에서 쿼리합니다. 그렇지 않으면 DNS 쿼리가 구성 파일에 표시된 순서대로 DNS 서버에 보내집니다.