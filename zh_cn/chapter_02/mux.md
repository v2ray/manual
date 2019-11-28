---
refcn: chapter_02/mux
refen: configuration/mux
---

# Mux 多路复用

Mux 功能是在一条 TCP 连接上分发多个 TCP 连接的数据。实现细节详见[Mux.Cool](../developer/protocols/muxcool.md)。Mux 是为了减少 TCP 的握手延迟而设计，而非提高连接的吞吐量。使用 Mux 看视频、下载或者测速通常都有反效果。Mux 只需要在客户端启用，服务器端自动适配。

## MuxObject

`MuxObject`对应`OutboundObject`中的`mux`项。

```javascript
{
  "enabled": false,
  "concurrency": 8
}
```

> `enabled`: true | false

是否启用 Mux 转发请求

> `concurrency`: number

最大并发连接数。最小值`1`，最大值`1024`，缺省默认值`8`。

特殊值`-1`，不加载mux模块。(4.22.0+)

这个数值表示了一个 TCP 连接上最多承载的 Mux 连接数量。当客户端发出了 8 个 TCP 请求，而`concurrency=8`时，V2Ray 只会发出一条实际的 TCP 连接，客户端的 8 个请求全部由这个 TCP 连接传输。
