---
refcn: chapter_02/protocols/dns
refen: configuration/protocols/dns
---

# DNS

* Name: `dns`
* Type: Outbound

DNS is an outbound proxy. It is mainly used for intercept and proxy DNS queries and responses. This outbound proxy can only accept DNS traffic, including both TCP and UDP based DNS queries. Other type of traffic will result in errors.

When proxying DNS queries, DNS outbound will redirect IP queries (A and AAAA) to [internal DNS server](../dns.md). It will send other type of queries directly to its original destination.

DNS outbound proxy is introduced in V2Ray 4.15.

## OutboundConfigurationObject

There is no detailed settings so far.

```javascript
{}
```
