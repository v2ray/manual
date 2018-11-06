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
  "유형": "필드",
  "도메인": [
    "baidu.com",
    "qq.com",
    "geosite : cn"
  ],
  "ip": [
    "0.0.0.0
    "10.0.0.0/8",
    "fc00 :: / 7",
    "fe80 :: / 10",
    "geoip : cn"
  ",
  "port ":"0-100 " ,
  "network": "tcp",
  "source": [
    "10.0.0.1",
  ],
  "user": [
    "love@v2ray.com"
  ],
  "inboundTag": [
    "tag-vmess"
  ,
  "protocol": [ "http", "tls", "bittorrent"],
  "outboundTag": "direct"
}
```

{% hint style = 'info'%} 여러 개의 필드가 지정되면 규칙을 적용하기 위해이 필드들을 모두 만족시켜야합니다. 당신이 모두 필요한 경우 `도메인` 과 `의 IP를` 규칙을, 당신이 별도의 규칙에 넣어 필요 가능성이 높다. {% endhint %}

> `유형`: "필드"

유효한 유일한 값은 `"필드"`입니다.

> `도메인`: \ [string \]

도메인 배열입니다. 사용 가능한 형식은 다음과 같습니다.

* 일반 텍스트 :이 문자열이 타겟팅 도메인의 일부와 일치하는 경우이 규칙은 효력을 갖습니다. 예 : 규칙 `"sina.com"` 은 도메인 `"sina.com"`, `"sina.com.cn"` 및 `"www.sina.com"`타겟팅하지만 `"sina.cn은 타겟팅하지 않습니다.`.
* 정규 표현식 : `"regexp :"`, 나머지는 정규 표현식입니다. 정규 표현식이 타겟팅 도메인과 일치하면이 규칙이 적용됩니다. 예 : 규칙 `"regexp : \\. goo. * \\. com $"` 은 `"www.google.com"` 및 `"fonts.googleapis.com"`와 일치하지만 `"google.com"`과 일치하지 않습니다. </code> .
* 하위 도메인 (권장) : `"도메인 :"` 로 시작하고 나머지는 도메인입니다. 타겟팅 도메인이 정확히 값이거나 값의 하위 도메인 인 경우이 규칙이 적용됩니다. 예 : 규칙 `"도메인 : v2ray.com"` 은 `"www.v2ray.com"`, `"v2ray.com"`와 일치하지만 `"xv2ray.com"은 일치하지 않습니다.`.
* 전체 도메인 : `"전체 :"` 나머지는 도메인입니다. 타겟팅 도메인이 정확히 값일 경우 규칙이 적용됩니다. 예 : 규칙 `"도메인 : v2ray.com"` 은 `"v2ray.com"`과 일치하지만 `"www.v2ray.com"과 일치하지 않습니다.`.
* 특별 값 `"geosite : cn"`: 중국의 [공통 도메인 목록](https://www.v2ray.com/links/chinasites/).
* 특별 값 `"geosite : speedtest"` (V2Ray 3.32+) : speedtest.net의 모든 공용 서버 목록.
* 파일에서 도메인 : `"ext : file : tag"와 같은`. 값은 `ext :` (소문자)로 시작해야하며 그 다음에 파일 이름과 태그가 와야합니다. 파일은 [리소스 디렉토리](env.md#location-of-v2ray-asset)에 저장되며 `geosite.dat와 동일한 형식을가집니다.`. 태그는 파일에 존재해야합니다.

> `ip`: \ [string \]

IP 범위의 배열. 타겟팅 IP가 범위 중 하나에 있으면이 규칙이 적용됩니다. 사용 가능한 형식 :

* IP : 예 : `"127.0.0.1"`.
* [CIDR](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing):과 같은 `"127.0.0.0/8"`.
* GeoIP : `"geoip : cn"`. 그것은으로 시작된다. `geoip :` (소문자)를 입력하고 2 자의 국가 코드를 입력하십시오. 
  * 특별 값 `"geoip : 비공개"`: `와 같은 모든 비공개 주소 127.0.0.1`.
* 파일에서 IP : `"ext : file : tag"`. 값은 `ext :` (소문자)로 시작해야하며 그 다음에 파일 이름과 태그가 와야합니다. 파일은 [리소스 디렉토리](env.md#location-of-v2ray-asset)에 저장되며 `geoip.dat와 같은 형식을가집니다.`. 태그는 파일에 존재해야합니다.

{% 힌트 스타일 = '정보'} % `"EXT : geoip.dat : CN"` 에 상당 `"GeoIP가 : CN"`. {% endhint %}

> `포트`: 번호 | 끈

포트 범위. 형식은 다음과 같습니다.

* `"ab"`: `a` 과 `b` 는 모두 양의 정수이고 65536보다 작습니다. 대상 포트가 [`a`, `b`] 인 경우이 규칙이 적용됩니다.

* `a`: `a` 은 양의 정수이고 65536 미만입니다. 대상 포트가 ``일 때이 규칙이 적용됩니다.

> `네트워크`: "tcp"| "udp"| "tcp, udp"

선택한 네트워크에 연결이 있으면이 규칙이 적용됩니다.

> `소스`: \ [string \]

IP 범위의 배열. `ip`과 같은 형식입니다. 연결의 소스 IP가 IP 범위에 있으면이 규칙이 적용됩니다.

> `사용자`: \ [string \]

전자 메일 주소의 배열입니다. 인바운드 연결에서 전자 메일 주소의 사용자 계정을 사용하면이 규칙이 적용됩니다. 현재 Shadowsock과 VMess는 이메일을 통해 사용자를 지원합니다.

> `인바운드 태그`: \ [문자열 \]

인바운드 프록시 태그로서의 문자열 배열입니다. 지정된 인바운드 프록시 중 하나에서 연결이 오면이 규칙이 적용됩니다.

> `프로토콜`: \ [ "http"| "tls"| "비트 토 런트"\]

프로토콜 타입으로서의 문자열의 배열. 연결에서 프로토콜 중 하나를 사용하면이 규칙이 적용됩니다. 연결의 프로토콜을 인식하기 위해, 하나는 활성화해야합니다 `스니핑` 인바운드 프록시에서 옵션을 선택합니다.

> `outboundTag` 문자열

[이 규칙이 적용되면 연결이 전송 될 아웃 바운드](protocols.md) 태그.