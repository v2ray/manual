---
refcn: chapter_02/04_dns
refen: configuration/dns
---

# DNS

V2Ray has an internal DNS server which provides DNS relay for other components.

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
      ]
    },
    "8.8.8.8",
    "8.8.4.4",
    "localhost"
  ],
  "clientIp": "1.2.3.4",
  "tag": "dns_inbound"
}
```

> `hosts`: map{string: address}

A list of static addresses, in the form of `domain:address`. Each entry has a domain name as key and IP or domain address as value. If a DNS query targets one of the domains in this list, the corresponding IP will be returned immediately and DNS query will not be relayed, or the corresponding domain address will be used for further DNS queries, instead of the previous one.

The format of domains is:

* Plaintext: When the targeting domain is exactly the value, the rule takes effect. Example: rule `"v2ray.com"` matches `"v2ray.com"`, but not `"www.v2ray.com"`.
* Regular expression: Begining with `"regexp:"`, the rest is a regular expression. When the regexp matches targeting domain, this rule takes effect. Example: rule `"regexp:\\.goo.*\\.com$"` matches `"www.google.com"` and `"fonts.googleapis.com"`, but not `"google.com"`.
* Subdomain (recommended): Begining with `"domain:"` and the rest is a domain. When the targeting domain is exactly the value, or is a subdomain of the value, this rule takes effect. Example: rule `"domain:v2ray.com"` matches `"www.v2ray.com"`, `"v2ray.com"`, but not `"xv2ray.com"`.
* Keyword: Begining with `"keyword:"` and the rest is a pattern. If this string matches any part of the targeting domain, this rule takes effet. Example: rule `"keyword:sina.com"` matches targeting domain `"sina.com"`, `"sina.com.cn"` and `"www.sina.com"`, but not `"sina.cn"`.
* Pre-defined domain list: Begining with `"geosite:"` and the rest is a name, such as `geosite:google` or `geosite:cn`. See [Pre-defined domain list](routing.md#pre-defined-domain-lists) for more detail.

> `servers`: \[string | [ServerObject](#serverobject) | "localhost" \]

List of DNS servers. Each server may be specified in three formats: IP address, [ServerObject](#serverobject), or `"localhost"`.

When a server is an IP address, such as `"8.8.8.8"`, V2Ray queries DNS on UDP port 53 on this address.

When a server is `"localhost"`, V2Ray queries local host for DNS.

{% hint style='info' %}

When `"localhost"` is used, out-going DNS traffic is not controlled by V2Ray. However, you may redirect DNS queries back to V2Ray with additional configuration.

{% endhint %}

> `clientIp`: string

IP address of current machine. If specified, V2Ray uses this IP as EDNS-Client-Subnet. This IP can't be a private address.

> `tag`: string

(V2Ray 4.13+) All traffic initiated from this DNS, except to localhost, will have this tag as inbound. It can be used for routing.

### ServerObject

```javascript
{
  "address": "1.2.3.4",
  "port": 5353,
  "domains": [
    "domain:v2ray.com"
  ],
}
```

> `address`: address

Address of the DNS server. For now only UDP servers are supported.

> `port`: number

Port of the DNS server. Usually it is `53` or `5353`.

> `domains`: \[string\]

A list of domains. If the domain of enquire matches one of the list, this DNS server will be prioritized for DNS query for this domain.

Domain name format is the same as in [routing](routing.md).

When a DNS server has the domain in its domain list, the domain will be queried in this server first, and then other servers. Otherwise DNS queries are sent to DNS servers in the order they appear in the config file.
