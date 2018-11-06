---
refcn: chapter_02/policy
refen: configuration/policy
---
# 지역 정책

로컬 정책은 현재의 V2Ray 인스턴스의 정책 설정 (예 : 연결 시간 초과)을 관리합니다. 정책은 각 사용자 수준 또는 전체 시스템에 적용 할 수 있습니다.

## PolicyObject

`PolicyObject` 은 최상위 레벨 구성에서 `policy` 필드로 사용됩니다.

```javascript
{
  "levels": {
    "0": {
      "handshake": 4,
      "connIdle": 300,
      "uplinkOnly": 2,
      "downlinkOnly": 5,
      "statsUserUplink": false,
      "statsUserDownlink": false
    }
  },
  "system": {
    "statsInboundUplink": false,
    "statsInboundDownlink": false
  }
}
```

어디에:

* `수평`: 키 값 쌍 목록입니다. 각 키는 다음과 같이 정수 문자열 (JSON에 의해 ​​제한됨)입니다. `"0"`, `"1"`숫자 값은 특정 사용자 수준입니다. 각 값에는 다음과 같은 속성이 있습니다. 
  * `핸드 셰이크`: 연결을 설정하기위한 제한 시간 (초). 기본값 `4`.
  * `connIdle`: 유휴 연결 시간 초과 (초). 기본값 `300`.
  * `uplinkOnly`: 연결의 업 링크가 닫힌 후 연결을 유지하는 시간 (초). 기본값 `2`.
  * `downlinkOnly`: 연결의 다운 링크가 닫힌 후 연결을 유지하는 시간 (초). 기본값 `5`.
  * `statsUserUplink`: `설정하면`, V2Ray는 통계 카운터가이 레벨의 모든 사용자에 대해 업 링크 트래픽을 활성화합니다.
  * `statsUserDownlink`: `설정하면`, V2Ray는이 레벨의 모든 사용자에 대해 통계 카운터가 트래픽을 다운 링크하도록합니다.
  * `bufferSize` (V2Ray 3.24+) : 연결 당 내부 버퍼 크기 (킬로바이트). 기본값은 `입니다. 10240`. `0`로 설정하면 내부 버퍼가 비활성화됩니다.
* `체계` (V2Ray 3.18+) : V2Ray의 시스템 정책 
  * `statsInboundUplink` (V2Ray 3.18+) : `설정하면`, V2Ray는 모든 인바운드 프록시의 모든 업 링크 트래픽에 대한 통계 카운터를 사용합니다.
  * `statsInboundDownlink` (V2Ray 3.18+) : `설정하면`, V2Ray는 모든 인바운드 프록시에서 모든 다운 링크 트래픽에 대한 통계 카운터를 사용합니다.

V2Ray가 연결을 처리 할 때의 세부 정보 :

1. 그 이상 걸리는 경우 새 연결을 처리 인바운드 프록시의 핸드 쉐이크 단계에서, VMess 요청 헤더를 읽고 말할 `악수를` V2Ray 연결을 중단 시간을.
2. `connIdle` 시간 동안 연결을 통해 전달 된 데이터가 없으면 V2Ray는 연결을 중단합니다.
3. 클라이언트 (브라우저)가 연결의 업 링크를 닫은 후 V2Ray는 `downlinkOnly` 번 후에 연결을 중단합니다.
4. 연결의 다운 링크를 닫는 원격 (서버) 후 V2Ray 후 접속 중단 `uplinkOnly` 회.

## 팁 {#tips}

* 각 인바운드 및 아웃 바운드 연결은 사용자 수준을 적용 할 수 있습니다. V2Ray는 사용자 수준에 따라 해당 정책을 적용합니다.
* `bufferSize` `오버라이드합니다. v2ray.ray.buffer.size <a href="env.md#cache-size-per-connection">env 변수에` 설정</a>.