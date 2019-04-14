---
refcn: chapter_02/transport/websocket
refen: configuration/transport/websocket
---

# WebSocket 传输方式

使用标准的 WebSocket 来传输数据。WebSocket 连接可以被其它 HTTP 服务器（如 NGINX）分流。

{% hint style='info' %}
Websocket 会识别 HTTP 请求的 X-Forwarded-For 头来用做流量的源地址。
{% endhint %}

## 示例配置

```javascript
{
  "path": "/",
  "headers": {
    "Host": "v2ray.com"
  }
}
```

> `path` string

WebSocket 所使用的 HTTP 协议路径，默认值为 `"/"`。

> `headers`: map\{string: string\}

自定义 HTTP 头，一个键值对，每个键表示一个 HTTP 头的名称，对应的值是字符串。默认值为空。
