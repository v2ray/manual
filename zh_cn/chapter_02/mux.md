# Mux 多路复用

Mux 功能是在一条 TCP 连接上分发多个 TCP 连接的数据。实现细节详见[Mux.Cool](../chapter_04/muxcool.md)

配置：

```javascript
{
  "enabled": false
}
```

其中：
* enabled: 是否启用 Mux

** Mux 目前处于测试阶段，期间请保持客户端服务器版本一致以达到最稳定的效果。**

Mux 只需要在客户端启用，服务器端自动适配。

一些暂时不能调整的参数：

* 一条 TCP 连接最多可以并发传输 8 条子连接；
* 一条 TCP 连接最多传输 128 条连接之后关闭；

