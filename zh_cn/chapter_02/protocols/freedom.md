---
refcn: chapter_02/protocols/freedom
refen: configuration/protocols/freedom
---

# Freedom

Freedom 是一个出站数据协议，可以用来向任意网络发送（正常的） TCP 或 UDP 数据。

* 名称：freedom
* 类型：Outbound
* 配置：

```javascript
{
  "domainStrategy": "AsIs",
  "redirect": "127.0.0.1:3366",
  "userLevel": 0
}
```

其中：

* `domainStrategy`: 域名解析策略，可选的值有：
  * `"AsIs"`: 默认值。不作更改，由操作系统解析。
  * `"UseIP"`: 使用 V2Ray 的 [DNS 服务器](../04_dns.md)解析成 IP 之后再发送数据。
* `redirect`: 将所有数据发送到指定地址（而不是入站协调指定的地址）。其值为一个字符串，样例：`"127.0.0.1:80"`, `":1234"`。
  * 当地址不指定时，如`":443"`，Freedom 不会修改原先的目标地址。
  * 当端口为`0`时，如`"v2ray.com:0"`，Freedom 不会修改原先的端口。
* `userLevel`: 用户等级，所有连接都使用这一等级。
