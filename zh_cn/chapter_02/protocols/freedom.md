# Freedom

Freedom 是一个传出数据协议，可以用来向任意网络发送（正常的） TCP 或 UDP 数据。

* 名称：freedom
* 类型：Outbound
* 配置：

```javascript
{
  "domainStrategy": "AsIs",
  "timeout": 0,
  "redirect": "127.0.0.1:3366"
}
```

其中：

* `domainStrategy`: 域名解析策略，可选的值有：
  * `"AsIs"`: 默认值。不作更改，由操作系统解析。
  * `"UseIP"`: 使用 V2Ray 的 [DNS 服务器](../04_dns.md)解析成 IP 之后再发送数据。
* `timeout`: 从目标服务器读取响应数据的时限，单位为秒，0 表示不限时。默认值为 `0`。
* `redirect` (V2Ray 2.16+): 将所有数据发送到指定地址（而不是传入协调指定的地址）。其值为一个字符串，样例：`"127.0.0.1:80"`, `":1234"`。
