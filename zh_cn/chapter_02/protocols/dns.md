---
refcn: chapter_02/protocols/dns
refen: configuration/protocols/dns
---

# DNS

* 名称: `dns`
* 类型: 出站协议

DNS 是一个出站协议，主要用于拦截和转发 DNS 查询。此出站协议只能接收 DNS 流量（包含基于 UDP 和 TCP 协议的查询），其它类型的流量会导致错误。

在处理 DNS 查询时，此出站协议会将 IP 查询（即 A 和 AAAA）转发给内置的 [DNS 服务器](../04_dns.md)。其它类询的流量将被转发至它们原本的目标地址。

## DnsOutboundObject

DNS 协议目前没有配置项。

```javascript
{}
```
