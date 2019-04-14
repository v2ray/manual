---
refcn: chapter_02/api
refen: configuration/api
---
# API

V2Ray는 원격 액세스를위한 몇 가지 API를 제공합니다. 이 API는 [gRPC](https://grpc.io/)기반으로합니다.

API가 활성화되면 V2Ray는 아웃 바운드 프록시를 자동으로 생성하고 `태그`로 태그를 지정합니다. 사용자는 [](routing.md) 모든 gRPC 연결을이 아웃 바운드로 라우트해야합니다.

## ApiObject

`ApiObject` 은 최상위 레벨 구성에서 `api` 필드로 사용됩니다.

```javascript
{
  "tag": "api",
  "services": [
    "HandlerService",
    "LoggerService",
    "StatsService"
  ]
}
```

> `태그`: 문자열

아웃 바운드 프록시의 태그입니다.

> `서비스`: \ [string \]

사용 가능한 API 목록입니다.

## 지원되는 API 목록

### HandlerService

인바운드 및 아웃 바운드 프록시를 조작하기위한 API 다음과 같은 기능이 제공됩니다.

* 새로운 인바운드 / 아웃 바운드 프록시를 추가하십시오.
* 기존의 인바운드 / 아웃 바운드 프록시를 제거합니다.
* 인바운드 프록시에 새 사용자를 추가합니다 (VMess 전용).
* 인바운드 프록시에서 기존 사용자를 제거합니다 (VMess 전용).

### LoggerService

내부 로거를 다시 시작합니다. 로그 파일을 작동하기위한 logrotate로 작업 할 수 있습니다.

### StatsService

내부 [통계 지원](stats.md).