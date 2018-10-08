# Blackhole

[![English][1]][2] [![German][3]][4] [![Russian][5]][6]

[1]: ../../resources/english.svg
[2]: https://www.v2ray.com/en/configuration/protocols/blackhole.html
[3]: ../../resources/german.svg
[4]: https://www.v2ray.com/de/configuration/protocols/blackhole.html
[5]: ../../resources/russian.svg
[6]: https://www.v2ray.com/ru/configuration/protocols/blackhole.html

Blackhole（黑洞）是一个传出数据协议，它会阻碍所有数据的传出，配合[路由（Routing）](../03_routing.md)一起使用，可以达到禁止访问某些网站的效果。

* 名称：blackhole
* 类型：Outbound
* 配置：

```javascript
{
  "response": {
    "type": "none"
  }
}
```

其中：

* `response`: 配置黑洞的响应数据。Blackhole 会在收到待转发数据之后，发送下面的响应数据（如果有的话），然后关闭连接。待转发的数据将被丢弃。
  * `type`: 数据类型，可选的值有：
    * `"none"`: 默认值，不返回任何数据直接关闭连接；
    * `"http"`: 返回一个简单的 HTTP 403 响应；
