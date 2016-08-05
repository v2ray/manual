# Freedom
Freedom 是一个传出数据协议，可以用来向任意网络发送（正常的） TCP 或 UDP 数据。

* 名称：freedom
* 类型：Outbound
* 配置：

```javascript
{
  "domainStrategy": "AsIs",
  "timeout": 0
}
```

其中：
* `domainStrategy`: 域名解析策略，可选的值有：
  * `"AsIs"`: 默认值。不作更改，由操作系统解析。
  * `"UseIP"`: 使用 V2Ray 的 [DNS 服务器](../04_dns.md)解析成 IP 之后再发送数据。
* `timeout`: 从目标服务器读取响应数据的时限，单位为秒，0 表示不限时。默认值为 `0`。
