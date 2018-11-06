---
refcn: chapter_02/protocols/freedom
refen: configuration/protocols/freedom
---
# Freedom

* 이름 : `자유`
* 유형 : 아웃 바운드

Freedom은 아웃 바운드 연결을위한 프로토콜입니다. 모든 TCP 또는 UDP 연결을 목적지로 전달합니다. 이 아웃 바운드는 실제 대상으로 트래픽을 보내려는 경우에 사용됩니다.

## ConfigurationObject

```javascript
{
  "domainStrategy": "AsIs",
  "redirect": "127.0.0.1:3366",
  "userLevel": 0
}
```

> `domainStrategy`: "AsIs"| "IP 사용"

도메인 이름 분석을위한 전략. 옵션은 다음과 같습니다.

* `"AsIs"`: 기본값. 시스템별로 도메인 이름을 확인하십시오.
* `"UseIP"`: 도메인 이름 확인을 위해 [내부 DNS](../dns.md) 을 사용하십시오.

> `리디렉션`: address_port

같은 형태로,이 주소로 모든 연결을 리디렉션 `"127.0.0.1:80"` 또는 `": 1234"`.

* 주소가 비어 있으면 (예 : `": 443"`, Freedom은 원래 대상 주소를 사용합니다.
* 포트 인 경우 `0`, 예를 들어 `"v2ray.com:0"`, 자유는 원래 포트를 사용합니다.

> `userLevel`: number

사용자 수준. 모든 연결은이 수준을 공유합니다.