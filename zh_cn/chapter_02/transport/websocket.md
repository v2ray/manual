# WebSocket 传输方式

使用标准的 WebSocket 来传输数据。WebSocket 连接可以被其它 HTTP 服务器（如 NGINX）分流。

配置：

```javascript
{
  "connectionReuse": true,
  "path": ""
}
```

其中：

* `connectionReuse`: 是否重用 TCP 连接，默认值为 `true`。
* `path`: WebSocket 所使用的 HTTP 协议路径，默认值为 `""`。
