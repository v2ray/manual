# Mux 多路复用

[![English][1]][2] [![German][3]][4] [![Russian][5]][6]

[1]: ../resources/english.svg
[2]: https://www.v2ray.com/en/configuration/mux.html
[3]: ../resources/german.svg
[4]: https://www.v2ray.com/de/configuration/mux.html
[5]: ../resources/russian.svg
[6]: https://www.v2ray.com/ru/configuration/mux.html

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
