# WebSocket

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
