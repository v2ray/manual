---
refcn: chapter_02/transport/websocket
refen: configuration/transport/websocket
---
# 웹 소켓

표준 WebSocket을 사용하여 데이터를 전송하십시오. Websocket 연결은 Nginx와 같은 HTTP 서버에 의해 프록시 될 수 있습니다.

## WebSocketObject

`WebSocketObject` 로 사용되는 `wsSettings` 에서 `TransportObject` 또는 `StreamSettingsObject`.

{% hint style='info' %}

Websocket recognizes HTTP header X-Forwarded-For, and uses it as inbound source address.

{% endhint %}

```javascript
{
  "path": "/",
  "headers": {
    "Host": "v2ray.com"
  }
}
```

> `경로`: 문자열

Path used for WebSocket. Default to root, as `"/"`.

> `headers`: map{string, string}

Custom HTTP header. An array where each entry is a key value pair in string, for header and value in HTTP header. Default is empty.