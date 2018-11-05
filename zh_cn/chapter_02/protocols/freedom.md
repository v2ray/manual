---
refcn: chapter_02/protocols/freedom
refen: configuration/protocols/freedom
---

# Freedom

* 名称：`freedom`
* 类型：出站协议

Freedom 是一个出站协议，可以用来向任意网络发送（正常的） TCP 或 UDP 数据。

## OutboundConfigurationObject

```javascript
{
  "domainStrategy": "AsIs",
  "redirect": "127.0.0.1:3366",
  "userLevel": 0
}
```

> `domainStrategy`: "AsIs" | "UseIP"

在目标地址为域名时，Freedom 可以直接向此域名发出连接（`"AsIs"`），或者将域名解析为 IP 之后再建立连接（`"UseIP"`）。解析 IP 的步骤会使用 V2Ray [内建的 DNS](../04_dns.md)。默认值为`"AsIs"`。

> `redirect`: address_port

Freedom 会强制将所有数据发送到指定地址（而不是入站协议指定的地址）。其值为一个字符串，样例：`"127.0.0.1:80"`, `":1234"`。当地址不指定时，如`":443"`，Freedom 不会修改原先的目标地址。当端口为`0`时，如`"v2ray.com:0"`，Freedom 不会修改原先的端口。

> `userLevel`: number

用户等级，所有连接都使用这一等级。
