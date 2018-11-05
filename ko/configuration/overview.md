---
refcn: chapter_02/01_overview
refen: configuration/overview
---
# 구성 개요

V2Ray는 아래와 같이 서버 측과 클라이언트 측의 구성이 동일합니다. 서버 및 클라이언트 구성은 특정 섹션에서 다릅니다.

아래는 구성의 최상위 레벨 구조입니다. 각 섹션에는 자체 형식이 있습니다.

```javascript
{
  ,
  } {}, {}, 
 "api": {},
  "dns": {},
  "통계": {},
  "라우팅": {},
  "정책": {},
  "인바운드"[],
  "outbounds"[],
  "inboundDetour"[],
  "outboundDetour"[]
  의 "전송"} {
}
```

> `로그`: [LogObject](#logobject)

로그 출력을 제어하기위한 로그 구성.

> `api`: [ApiObject](api.md)

V2Ray 인스턴스를 제어하는 ​​RPC API 자세한 내용은 [API 구성](api.md) 을 참조하십시오.

> `dns`: [DnsObject](dns.md)

내부 DNS 서버 구성을위한 구성. 이 섹션을 생략하면 V2Ray는 시스템 전체의 DNS 구성을 사용합니다. 자세한 내용은 [DNS 구성을 참조하십시오.](dns.md).

> `stats`: [StatsObject](stats.md)

지정되면 내부 [통계](stats.md) 이 사용됩니다.

> `정책`: [PolicyObject](policy.md)

사용 권한 및 기타 보안 전략을위한 구성. 자세한 내용은 [로컬 정책](policy.md)참조하십시오.

> `라우팅`: [RoutingObject](routing.md)

내부 [라우팅](routing.md) 전략을위한 구성.

> `인바운드`: \ [ [인바운드 개체](#inboundobject)\]

인바운드 프록시의 구성으로 [InboundObject](#inboundobject) 배열입니다.

> `아웃 바운드`: \ [ [아웃 바운드 개체](#outboundobject)\]

아웃 바운드 프록시의 구성으로서 [OutboundObject](#outboundobject) 배열입니다. 배열의 첫 번째 아웃 바운드가 주요 아웃 바운드입니다. 라우팅 결정시 기본 아웃 바운드입니다.

> `전송`: [전송 객체](transport.md)

낮은 수준의 전송 프로토콜 구성 자세한 내용은 [프로토콜 전송 옵션](transport.md)참조하십시오.

## LogObject

```javascript
{
  "접근": "/ 경로 / to / 파일",
  "오류": "/ path / to / file",
  "loglevel": "경고"
}
```

> `액세스`: 문자열

로그에 액세스하는 경로입니다. 비어 있지 않은 경우, 법적 파일 경로 여야합니다 같은 `"/tmp/v2ray/_access.log"`(리눅스), 또는 `개의 "C : \\ 온도 \\ v2ray \\ _ access.log의"`(윈도우 ). 비어있는 경우 V2Ray는 액세스 로그를 `표준 출력`씁니다.

> `오류`: 문자열

오류 로그의 경로. 비어 있지 않은 경우 합법적 인 파일 경로 여야합니다. 비어있는 경우 V2Ray는 오류 로그를 `표준 출력`씁니다.

> `loglevel`: "디버그"| "정보"| "경고"| "오류"| "없음"

기록 할 로그의 레벨. 다른 로그 레벨은 로그의 다른 내용을 나타냅니다. 기본값은 `"경고"`.

로그 수준 :

* `"debug"`: 개발자 전용 정보. 또한 `"info"` 로그를 모두 포함합니다.
* `"정보"`: V2Ray의 현재 상태에 대한 정보. 사용자는 이러한 문제를 처리 할 필요가 없습니다. 또한 `"경고"` 로그를 모두 포함합니다.
* `"경고"`: 환경에 문제가 있습니다. 일반적으로 V2Ray 외부에 있습니다 (예 : 네트워크 손상). V2Ray는 계속 실행되지만 사용자가 일부 손상을 입을 수 있습니다. 또한 모든 포함 `"오류"` 로그.
* `"오류"`: 뭔가 잘못되었습니다. V2Ray가 전혀 실행되지 않습니다.
* `"none"`: 모든 로깅을 사용할 수 없습니다.

## 인바운드 객체

InboundObject는 인바운드 프록시를 정의합니다. V2Ray 로의 수신 연결을 처리합니다. 사용 가능한 프록시는 여기에 나열된 [입니다.](protocols.md).

```javascript
{
  "포트"1080,
  "수신" "127.0.0.1"
  "프로토콜": "protocol_name"
  "설정"{},
  "streamSettings"{},
  "태그": " inbound_tag_name ",
  "스니핑 ": {
    "활성화 "거짓,
    "destOverride ":"HTTP ","TLS "]
  },
  "할당 ": {
    "전략 ":"항상 ",
    " 새로 고침 ": 5,
    "동시성 ": 3
  },
}
```

> `포트`: 번호 | "env : 변수"| 끈

프록시가 수신 대기하는 포트입니다. 사용할 수있는 형식은 다음과 같습니다.

* 정수 : 실제 포트 번호.
* 환경 변수를 시작으로 `"ENV는"`, ENV 변수는 문자열 형식의 포트와 같은 지정 `: "PORT ENV를"`. V2Ray는 변수를 문자열로 디코딩합니다.
* 문자열 : `"1234"`과 같은 숫자 문자열 값 또는 총 6 개의 포트에 대해 `"5-10"` 과 같은 포트 범위.

열려는 실제 포트도 `할당` 설정에 따라 다릅니다. 아래를 참조하십시오.

> `듣기`: 주소

들릴 주소. 기본값은 `"0.0.0.0"` 모든 네트워크 인터페이스에서 들어오는 연결합니다. 그렇지 않으면 값은 기존 네트워크 인터페이스의 주소 여야합니다.

> `프로토콜`: 문자열

인바운드 프로토콜의 이름. 사용 가능한 값은 각 개인을 참조하십시오.

> `설정`: InboundConfigurationObject

프로토콜 별 설정. 각 프로토콜에 정의 된 `InboundConfigurationObject` 참조하십시오.

> `streamSettings`: [StreamSettingsObject]

세부 사항은 [프로토콜 전송 옵션](transport.md) 을 참조하십시오.

> `태그`: 문자열

인바운드 프록시의 태그. 라우팅 결정에 사용될 수 있습니다. 비어 있지 않으면 모든 인바운드 프록시 중에서 고유해야합니다.

> `스니핑`: [스니핑 객체](#sniffingobject)

콘텐츠 스니핑을위한 구성.

> `할당`: [AllocateObject](#allocateobject)

포트 할당을위한 구성.

### SniffingObject

```javascript
{
  "enabled": false,
  "destOverride": [ "http", "tls"]
}
```

> `활성화 됨`: true | 그릇된

콘텐츠 스니핑을 사용할지 여부.

> `destOverride`: \ [ "http"| "tls"\]

내용 유형의 배열입니다. 들어오는 트래픽의 컨텐트 유형이 목록에 지정되어 있으면 연결 대상이 스니핑 된 값으로 덮어 쓰여집니다.

### AllocateObject

```javascript
{
  "전략": "항상",
  "새로 고침": ​​5,
  "동시성": 3
}
```

> `전략`: "항상"| "무작위"

포트 할당 전략. `"항상"`로 설정되면 `포트` 필드의 모든 포트가 청취에 할당됩니다. `"임의"` 이 설정된 경우 V2Ray는 `동시성` 포트를 수신하고 `새로 고침` 분마다 포트 목록이 다시 채워집니다.

> `새로 고침`: 번호

청취 포트를 새로 고치는 시간 (분)입니다. 최소값은 `2`입니다. 이 설정은 `전략` 이 `"임의"`설정된 경우에만 유효합니다.

> `동시성`: 숫자

수신 대기 포트 수입니다. 최소값은 `1`입니다. 최대 값은 전체 포트 범위의 1/3입니다.

## 아웃 바운드 개체

OutboundObject는 나가는 연결을 처리하기위한 아웃 바운드 프록시를 정의합니다. 사용 가능한 프로토콜이 나열됩니다 [여기](protocols.md).

```javascript
{
  "sendThrough": "0.0.0.0",
  "protocol_name",
  "설정": {},
  "태그": "this_outbound_tag_name",
  "streamSettings": {},
  "proxySettings" : {
    "tag": "another_outbound_tag_name"
  },
  "mux": {}
}
```

> `sendThrough`: 주소

트래픽을 보내는 IP 주소입니다. 기본값 " `"0.0.0.0 "` 은 호스트에서 사용 가능한 IP를 무작위로 선택하기위한 것입니다. 그렇지 않으면 값은 기존 네트워크 인터페이스의 IP 주소 여야합니다.

> `프로토콜`: 문자열

이 아웃 바운드의 프로토콜 이름입니다. 사용 가능한 모든 값에 대해서는 [프로토콜](protocols.md) 을 참조하십시오.

> `설정`: OutboundConfigurationObject

프로토콜 별 설정. 각 개별 프로토콜에서 `OutboundConfigurationObject` 을 참조하십시오.

> `태그`: 문자열

이 아웃 바운드의 태그입니다. 비어 있지 않으면 모든 아웃 바운드 중에서 고유해야합니다.

> `streamSettings`: [StreamSettingsObject](transport.md)

낮은 수준의 전송 설정. [프로토콜 전송 옵션](transport.md)참조하십시오.

> `proxySettings`: [ProxySettingsObject](#proxysettingsobject)

이 아웃 바운드에서 다른 아웃 바운드로 트래픽을 위임하기위한 구성입니다. 이 값을 설정하면이 아웃 바운드의 `streamSettings` 이 적용되지 않습니다.

> `mux`: [MuxObject](mux.md)

세부 사항은 [Mux](mux.md) 구성을 참조하십시오.

### ProxySettingsObject

```javascript
{
  "tag": "another-outbound-tag"
}
```

> `태그`: 문자열

`태그` 이 다른 아웃 바운드의 태그로 설정되면 현재 아웃 바운드의 나가는 트래픽이 지정된 아웃 바운드 트래픽으로 위임됩니다.