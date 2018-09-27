# DNS

[![English](../resources/english.svg)](https://www.v2ray.com/en/configuration/dns.html) [![Chinese](../resources/chinese.svg)](https://www.v2ray.com/chapter_02/04_dns.html) [![German](../resources/german.svg)](https://www.v2ray.com/de/configuration/dns.html) [![Russian](../resources/russian.svg)](https://www.v2ray.com/ru/configuration/dns.html)

V2Ray has an internal DNS server which provides DNS relay for other components.

Configuration:

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

Where:

* `hosts`: A list of static IP addresses. Each entry has a domain name as key and IP address as value. If a DNS query targets one of the domains in this list, the corresponding IP will be returned immediately and DNS query will not be relayed. The format of the domain is: 
  * Such as `"v2ray.com"`: The domain to be resolved has to equal to this domain.
  * Such as `"domain:v2ray.com"`: The domain to be resolved can be this domain or any of its sub-domains.
* `servers`: List of DNS servers. Each server may be specified in two formats: 
  * Basic: A string such as `"8.8.8.8"` for DNS server address with port `53`. When the value is `"localhost"`, V2Ray queries localhost for DNS.
  * Complete (V2Ray 3.42+): 
    * `address`: DNS server address, such as `"8.8.8.8"`.
    * `port`: DNS server port, such as `53`.
    * `domains`: List of domains that are prioritized for this server. The format of a domain is the same as it is in [routing config](routing.md).
* `clientIp`: IPv4 address of current system. This is used to notify DNS server for better IP resolution. The value can't be a private address.

To use the internal DNS service, you need to configure `domainStrategy` in [routing](routing.md).

The DNS queries relayed by this DNS service will also be dispatched based on routing settings. No extra configuration is required.

## Query strategy {#strategy}

DNS service will try to query both A and AAAA record in the same DNS message. As not all DNS servers support such query, V2Ray only sends A and AAAA query to the following DNS servers, and only send A queries to all other servers.

```text
8.8.8.8
8.8.4.4
9.9.9.9
```

## Tips {#tips}

* You are recommended to use DNS from your localhost, with a thirdparty DNS relay server, such as [CoreDNS](https://coredns.io/).
* When using localhost as DNS server, outbound DNS queries are not sent through V2Ray by default. You may need some settings to intercept those queries if necessary.
* When a DNS server has the domain in its domain list, the domain will be queries in this server first, and then other servers. Otherwise DNS queries are sent to DNS servers in the order they appear in the config file.