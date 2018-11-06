---
refcn: chapter_02/stats
refen: configuration/stats
---
# 통계

V2Ray는 내부 정보를 제공합니다.

## StatsObject

`StatsObject` 은 최상위 레벨 구성에서 `stats` 필드로 사용됩니다.

```javascript
{
}
```

모든 통계 카운터는 다음과 같습니다.

> `user>>>[email]>>>traffic>>>uplink`

Accumulated uplink traffic of specific user, in bytes.

> `user>>>[email]>>>traffic>>>downlink`

Accumulated downlink traffic of specific user, in bytes.

> `inbound>>>[tag]>>>traffic>>>uplink`

Accumulated uplink traffic of specific inbound, in bytes.

> `inbound>>>[tag]>>>traffic>>>downlink`

Accumulated downlink traffic of specific inbound, in bytes.

## 팁

* If a user doesn't have a valid email address, the stats will not be enabled.