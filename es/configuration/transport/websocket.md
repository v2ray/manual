# WebSocket

[![English](../../resources/english.svg)](https://www.v2ray.com/en/configuration/transport/websocket.html) [![Chinese](../../resources/chinese.svg)](https://www.v2ray.com/chapter_02/transport/websocket.html) [![German](../../resources/german.svg)](https://www.v2ray.com/de/configuration/transport/websocket.html) [![Russian](../../resources/russian.svg)](https://www.v2ray.com/ru/configuration/transport/websocket.html)

Use standard WebSocket to transport data. Websocket connections can be proxied by HTTP server such as Nginx.

Configuration:

```javascript
{
  "path": "",
  "headers": {
    "Host": "v2ray.com"
  }
}
```

Where:

* `path`: Path used for WebSocket. Default to root, as `""`。
* `headers`: Custom HTTP header. An array where each entry is a key value pair in string, for header and value in HTTP header. Default is empty.

## Notice

* Since V2Ray 3.4, Websocket recognizes X-Forwarded-For header and use it as source address of the traffic.