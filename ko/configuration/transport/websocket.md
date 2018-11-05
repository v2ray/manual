---
refcn: chapter_02/transport/websocket
refen: configuration/transport/websocket
---
# 웹 소켓

표준 WebSocket을 사용하여 데이터를 전송하십시오. Websocket 연결은 Nginx와 같은 HTTP 서버에 의해 프록시 될 수 있습니다.

## WebSocketObject

`WebSocketObject` 로 사용되는 `wsSettings` 에서 `TransportObject` 또는 `StreamSettingsObject`.

{% hint style = 'info'%} Websocket은 HTTP 헤더 X-Forwarded-For를 인식하고 인바운드 소스 주소로 사용합니다. {% endhint %}

```javascript
{
  "경로": "/",
  "헤더": {
    "호스트": "v2ray.com"
  }
}
```

> `경로`: 문자열

WebSocket에 사용되는 경로입니다. 루트 기본값, `"/"`.

> `헤더`:지도{string, string}

사용자 지정 HTTP 헤더. 각 항목은 HTTP 헤더의 헤더 및 값에 대한 문자열의 키 값 쌍인 배열입니다. 기본값은 비어 있습니다.