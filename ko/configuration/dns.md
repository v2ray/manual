---
refcn: chapter_02/04_dns
refen: configuration/dns
---
# DNS

V2Ray에는 다른 구성 요소에 대한 DNS 릴레이를 제공하는 내부 DNS 서버가 있습니다.

{% hint style='info' %}

Due to the complexity of DNS protocol, V2Ray for now only supports basic IP queries (A and AAAA). We recommend to use a professional DNS rely (such as [CoreDNS](https://coredns.io/)) for V2Ray.

{% endhint %}

The DNS queries relayed by this DNS service will also be dispatched based on routing settings. No extra configuration is required.

## DnsObject

`DnsObject` is used as `dns` field in top level configuration.

```javascript
{
  "hosts": {
    "baidu.com": "127.0.0.1"
  },
  "servers": [
    {
      "address": "1.2.3.4",
      "port": 5353,
      "domains": [
        "domain:v2ray.com"
      ],
    },
    "8.8.8.8",
    "8.8.4.4",
    "localhost"
  ],
  "clientIp": "1.2.3.4"
}
```

> `호스트`:지도{string: address}

A list of static IP addresses. Each entry has a domain name as key and IP address as value. If a DNS query targets one of the domains in this list, the corresponding IP will be returned immediately and DNS query will not be relayed.

The format of the domain is:

* `"v2ray.com"`: 해결할 도메인이이 도메인과 같아야합니다.
* `"domain : v2ray.com"`: 해결할 도메인은이 도메인 또는 그 하위 도메인이 될 수 있습니다.

> `서버`: \ [string | [ServerObject](#serverobject) | "localhost"\]

List of DNS servers. Each server may be specified in three formats: IP address, [ServerObject](#serverobject), or `"localhost"`.

When a server is an IP address, such as `"8.8.8.8"`, V2Ray queries DNS on UDP port 53 on this address.

When a server is `"localhost"`, V2Ray queries local host for DNS.

{% hint style='info' %}

When `"localhost"` is used, out-going DNS traffic is not controlled by V2Ray. However, you may redirect DNS queries back to V2Ray with additional configuration.

{% endhint %}

> `clientIp`: string

IP address of current machine. If specified, V2Ray uses this IP as EDNS-Client-Subnet. This IP can't be a private address.

### ServerObject

```javascript
{
  "주소": "1.2.3.4",
  "포트": 5353,
  "도메인": [
    "도메인 : v2ray.com"
  ],
}
```

> `주소`: 주소

Address of the DNS server. For now only UDP servers are supported.

> `포트`: 번호

Port of the DNS server. Usually it is `53` or `5353`.

> `도메인`: \ [string \]

A list of domains. If the domain of enquire matches one of the list, this DNS server will be prioritized for DNS query for this domain.

Domain name format is the same as in [routing](routing.md).

When a DNS server has the domain in its domain list, the domain will be queried in this server first, and then other servers. Otherwise DNS queries are sent to DNS servers in the order they appear in the config file.