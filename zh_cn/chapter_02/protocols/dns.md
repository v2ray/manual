---
refcn: chapter_02/protocols/dns
refen: configuration/protocols/dns
---

# DNS

* 名称: `dns`
* 类型: 出站协议

DNS 是一个出站协议，主要用于拦截和转发 DNS 查询。此出站协议只能接收 DNS 流量（包含基于 UDP 和 TCP 协议的查询），其它类型的流量会导致错误。

在处理 DNS 查询时，此出站协议会将 IP 查询（即 A 和 AAAA）转发给内置的 [DNS 服务器](../04_dns.md)。其它类询的流量将被转发至它们原本的目标地址。

DNS 出站协议在 V2Ray 4.15 中引入。

## OutboundConfigurationObject

```javascript
{
    "network": "tcp",
    "address": "1.1.1.1",
    "port": 53
}
```

> `network`: "tcp" | "udp"

(V2Ray 4.16+) 修改 DNS 流量的传输层协议，可选的值有`"tcp"`和`"udp"`。当不指定时，保持来源的传输方式不变。

> `address`: address

(V2Ray 4.16+) 修改 DNS 服务器地址。当不指定时，保持来源中指定的地址不变。

> `port`: number

(V2Ray 4.16+) 修改 DNS 服务器端口。当不指定时，保持来源中指定的端口不变。
