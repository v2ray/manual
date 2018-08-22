# WebSocket

[![English][1]][2] [![Chinese][3]][4] [![German][5]][6] [![Russian][7]][8]

[1]: ../../resources/english.svg
[2]: https://www.v2ray.com/en/configuration/transport/websocket.html
[3]: ../../resources/chinese.svg
[4]: https://www.v2ray.com/chapter_02/transport/websocket.html
[5]: ../../resources/german.svg
[6]: https://www.v2ray.com/de/configuration/transport/websocket.html
[7]: ../../resources/russian.svg
[8]: https://www.v2ray.com/ru/configuration/transport/websocket.html

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
