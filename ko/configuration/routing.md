---
refcn: chapter_02/03_routing
refen: configuration/routing
---
# 라우팅

V2Ray는 내부 라우팅 메커니즘을 가지고 있습니다. 규칙에 따라 인바운드 연결을 다양한 아웃 바운드로 라우팅합니다. 일반적인 시나리오는 국가별로 트래픽을 분할하는 것입니다. V2Ray는 연결의 대상 국가 (Geo IP 기준)를 감지하고 해당 아웃 바운드 프록시에 연결을 보냅니다.

## RoutingObject

`RoutingObject` 은 최상위 레벨 구성에서 `라우팅` 으로 사용됩니다.

```javascript
{
  "domainStrategy": "AsIs",
  "rules": []
}
```

> `domainStrategy`: "AsIs"| "IPIfNonMatch"| "IPOnDemand"

도메인 분석 전략. 선택 사항은 다음과 같습니다.

* `"AsIs"`: 라우팅에만 도메인을 사용하십시오. 기본값.
* `"IPIfNonMatch"`: 현재 도메인과 일치하는 규칙이 없으면 V2Ray가이를 IP 주소 (A 또는 AAAA 레코드)로 확인하고 모든 규칙을 다시 시도합니다. 
  * 도메인에 여러 IP 주소가있는 경우 V2Ray는 모든 IP 주소를 시도합니다.
  * 해결 된 IP는 라우팅 결정에만 사용되며 트래픽은 여전히 ​​원래 도메인 주소로 전송됩니다.
* `"IPOnDemand"`: IP 기반 규칙이있는 한 V2Ray는 도메인을 즉시 IP로 해석합니다.

> `규칙`: \ [[RuleObject](#ruleobject)\]

규칙의 배열. 각 인바운드 연결에 대해 V2Ray는 이러한 규칙을 하나씩 위에서 아래로 시도합니다. 규칙이 적용되면 연결은 규칙의 `outboundTag` 로 라우팅됩니다.

### RuleObject

```javascript
{
  "type": "field",
  "domain": [
    "baidu.com",
    "qq.com",
    "geosite:cn"
  ],
  "ip": [
    "0.0.0.0/8",
    "10.0.0.0/8",
    "fc00::/7",
    "fe80::/10",
    "geoip:cn"
  ],
  "port": "0-100",
  "network": "tcp",
  "source": [
    "10.0.0.1"
  ],
  "user": [
    "love@v2ray.com"
  ],
  "inboundTag": [
    "tag-vmess"
  ],
  "protocol":["http", "tls", "bittorrent"],
  "outboundTag": "direct"
}
```

{% hint style='info' %}

When multiple fields are specified, these fields have to be all satisfied, in order to make the rule effective. If you need both `domain` and `ip` rules, it is highly likely you need put them into separate rules.

{% endhint %}

> `유형`: "필드"

The only valid value for now is `"field"`.

> `도메인`: \ [string \]

An array of domains. Available formats are:

* 일반 텍스트 :이 문자열이 타겟팅 도메인의 일부와 일치하는 경우이 규칙은 효력을 갖습니다. 예 : 규칙 `"sina.com"` 은 도메인 `"sina.com"`, `"sina.com.cn"` 및 `"www.sina.com"`타겟팅하지만 `"sina.cn은 타겟팅하지 않습니다.`.
* 정규 표현식 : `"regexp :"`, 나머지는 정규 표현식입니다. 정규 표현식이 타겟팅 도메인과 일치하면이 규칙이 적용됩니다. 예 : 규칙 `"regexp : \\. goo. * \\. com $"` 은 `"www.google.com"` 및 `"fonts.googleapis.com"`와 일치하지만 `"google.com"`과 일치하지 않습니다. </code> .
* 하위 도메인 (권장) : `"도메인 :"` 로 시작하고 나머지는 도메인입니다. 타겟팅 도메인이 정확히 값이거나 값의 하위 도메인 인 경우이 규칙이 적용됩니다. 예 : 규칙 `"도메인 : v2ray.com"` 은 `"www.v2ray.com"`, `"v2ray.com"`와 일치하지만 `"xv2ray.com"은 일치하지 않습니다.`.
* 전체 도메인 : `"전체 :"` 나머지는 도메인입니다. 타겟팅 도메인이 정확히 값일 경우 규칙이 적용됩니다. 예 : 규칙 `"도메인 : v2ray.com"` 은 `"v2ray.com"`과 일치하지만 `"www.v2ray.com"과 일치하지 않습니다.`.
* 특별 값 `"geosite : cn"`: 중국의 [공통 도메인 목록](https://www.v2ray.com/links/chinasites/).
* 특별 값 `"geosite : speedtest"` (V2Ray 3.32+) : speedtest.net의 모든 공용 서버 목록.
* 파일에서 도메인 : `"ext : file : tag"와 같은`. 값은 `ext :` (소문자)로 시작해야하며 그 다음에 파일 이름과 태그가 와야합니다. 파일은 [리소스 디렉토리](env.md#location-of-v2ray-asset)에 저장되며 `geosite.dat와 동일한 형식을가집니다.`. 태그는 파일에 존재해야합니다.

> `ip`: \ [string \]

An array of IP ranges. When the targeting IP is in one of the ranges, this rule takes effect. Available formats:

* IP : 예 : `"127.0.0.1"`.
* [CIDR](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing):과 같은 `"127.0.0.0/8"`.
* GeoIP : `"geoip : cn"`. 그것은으로 시작된다. `geoip :` (소문자)를 입력하고 2 자의 국가 코드를 입력하십시오. 
  * 특별 값 `"geoip : 비공개"`: `와 같은 모든 비공개 주소 127.0.0.1`.
* 파일에서 IP : `"ext : file : tag"`. 값은 `ext :` (소문자)로 시작해야하며 그 다음에 파일 이름과 태그가 와야합니다. 파일은 [리소스 디렉토리](env.md#location-of-v2ray-asset)에 저장되며 `geoip.dat와 같은 형식을가집니다.`. 태그는 파일에 존재해야합니다.

{% hint style='info' %}

`"ext:geoip.dat:cn"` is equivalent to `"geoip:cn"`.

{% endhint %}

> `포트`: 번호 | 끈

Port range. Formats are:

* `"ab"`: `a` 과 `b` 는 모두 양의 정수이고 65536보다 작습니다. 대상 포트가 [`a`, `b`] 인 경우이 규칙이 적용됩니다.

* `a`: `a` 은 양의 정수이고 65536 미만입니다. 대상 포트가 ``일 때이 규칙이 적용됩니다.

> `네트워크`: "tcp"| "udp"| "tcp, udp"

When the connection has in the chosen network, this rule take effect.

> `소스`: \ [string \]

An array of IP ranges. Same format as `ip`. When the source IP of the connection is in the IP range, this rule takes effect.

> `사용자`: \ [string \]

An array of email address. When the inbound connection uses an user account of the email address, this rule takes effect. For now Shadowsocks and VMess support user with email.

> `인바운드 태그`: \ [문자열 \]

An array of string as inbound proxy tags. When the connection comes from one of the specified inbound proxy, this rule takes effect.

> `프로토콜`: \ [ "http"| "tls"| "비트 토 런트"\]

An array of string as protocol types. When the connection uses one of the protocols, this rule takes effect. To recognize the protocol of a connection, one must enable `sniffing` option in inbound proxy.

> `outboundTag` 문자열

[Tag of the outbound](protocols.md) that the connection will be sent to, if this rule take effect.