---
refcn: chapter_02/protocols/blackhole
refen: configuration/protocols/blackhole
---

# Blackhole

* 名称: blackhole
* 类型: 出站协议

Blackhole（黑洞）是一个出站数据协议，它会阻碍所有数据的出站，配合[路由（Routing）](../03_routing.md)一起使用，可以达到禁止访问某些网站的效果。

## 示例配置

```javascript
{
  "response": {
    "type": "none"
  }
}
```

> **response**: [ResponseObject](#responseobject)

配置黑洞的响应数据。Blackhole 会在收到待转发数据之后，发送指定的响应数据，然后关闭连接。待转发的数据将被丢弃。如不指定此项，Blackhole 将直接关闭连接。

### ResponseObject

```javascript
{
  "type": "none"
}
```

> **type**: "http" | "none"

当`type`为`"none"`（默认值）时，Blackhole将直接关闭连接。当`type`为`"http"`时，Blackhole会发回一个简单的 HTTP 403 数据包，然后关闭连接。
