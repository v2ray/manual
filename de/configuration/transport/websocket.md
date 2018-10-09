---
refcn: chapter_02/transport/websocket
refen: configuration/transport/websocket
---
# WebSocket

Use standard WebSocket to transport data. Websocket connections can be proxied by HTTP server such as Nginx.

Configuration:

```javascript
{"Pfad": "", "Kopfzeilen": {"Host": "v2ray.com"}}
```

Where:

* `path`: Path used for WebSocket. Default to root, as `""`。
* `headers`: Custom HTTP header. An array where each entry is a key value pair in string, for header and value in HTTP header. Default is empty.

## Beachten

* Seit V2Ray 3.4 erkennt Websocket den X-Forwarded-For-Header und verwendet ihn als Quelladresse des Datenverkehrs.