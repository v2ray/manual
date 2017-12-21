# Mux 多路复用

![Chinese](../resources/chinesec.svg) [![English](../resources/english.svg)](https://www.v2ray.com/en/configuration/mux.html)

Mux 功能是在一条 TCP 连接上分发多个 TCP 连接的数据。实现细节详见[Mux.Cool](https://www.v2ray.com/eng/protocols/muxcool.html)

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

** Mux 目前处于测试阶段，期间请保持客户端服务器版本一致以达到最稳定的效果。**

Mux 只需要在客户端启用，服务器端自动适配。

一些暂时不能调整的参数：

* 一条 TCP 连接最多传输 128 条连接之后关闭；
