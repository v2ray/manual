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

```javascript
{
    "network": "tcp",
    "address": "1.1.1.1",
    "port": 53
}
```

> `network`: "tcp" | "udp"

(V2Ray 4.16+) Modify the transport protocol of the DNS traffic. The value may be either `"tcp"` or `"udp"`. If it is not specified, the original protocol remains unchanged.

> `address`: address

(V2Ray 4.16+) Modify the DNS server address in the request. If it is not specified, the original DNS server address remain unchanged.

> `port`: number

(V2Ray 4.16+) Modify the DNS server port in the request. If it is not specified, the original DNS server port remain unchanged.