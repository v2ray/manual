---
refcn: chapter_02/mux
refen: configuration/mux
---

# Mux 多路复用

Mux 功能是在一条 TCP 连接上分发多个 TCP 连接的数据。实现细节详见[Mux.Cool](../developer/protocols/muxcool.md)

配置：

```javascript
{
  "enabled": false,
  "concurrency": 8
}
```

其中：

* enabled: 是否启用 Mux
* concurrency: 最大并发连接数。最小值`1`，最大值`1024`，默认值`8`。
  * 没有特殊需求一般不需要修改这个数值。

## 小贴士 {#tip}

* Mux 只需要在客户端启用，服务器端自动适配。
* 一条 TCP 连接最多传输 128 条连接之后关闭；
* Mux 是为了减少 TCP 的握手延迟而设计，而非提高连接的吞吐量。使用 Mux 看视频、下载或者测速通常都有反效果。
