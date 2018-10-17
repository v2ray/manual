---
refcn: chapter_02/transport/websocket
refen: configuration/transport/websocket
---
# WebSocket

Use standard WebSocket to transport data. Websocket connections can be proxied by HTTP server such as Nginx.

Конфигурация:

```javascript
{
  "path": "",
  "headers": {
    "Host": "v2ray.com"
  }
}
```

Где:

* `path`: Path used for WebSocket. Default to root, as `""`。
* `headers`: Custom HTTP header. An array where each entry is a key value pair in string, for header and value in HTTP header. Default is empty.

## Важно

* Начиная с V2Ray 3.4, Websocket распознает заголовок X-Forwarded-For и использует его как исходный адрес трафика.