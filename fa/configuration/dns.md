---
refcn: chapter_02/04_dns
refen: configuration/dns
---
# DNS

V2Ray دارای یک سرور DNS داخلی است که رله DNS را برای اجزای دیگر فراهم می کند.

{% hint style='info' %}

با توجه به پیچیدگی پروتکل DNS، V2Ray در حال حاضر تنها از درخواستهای IP اصلی (A و AAAA) پشتیبانی می کند. توصیه می کنیم از DNS حرفه ای (مانند [CoreDNS](https://coredns.io/)) برای V2Ray استفاده کنید.

{% endhint %}

پرسش های DNS که توسط این سرویس DNS رله می شود نیز براساس تنظیمات مسیریابی ارسال می شود. هیچ پیکربندی اضافی لازم نیست.

## DnsObject

`DnsObject` به عنوان `dns` فیلد در پیکربندی سطح بالا استفاده می شود.

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

The format of domains is the same as it in [routing](routing.md#ruleobject).

> `سرور`: \ [رشته | [ServerObject](#serverobject) | "localhost" \]

فهرست سرورهای DNS. هر سرور ممکن است در سه فرمت مشخص شود: آدرس IP، [ServerObject](#serverobject)یا `"localhost"`.

هنگامی که یک سرور یک آدرس IP است، مانند `"8.8.8.8"`، V2Ray در DNS UDP روی 53 آدرس در این آدرس نمایش داده می شود.

هنگامی که یک سرور `"localhost"`، V2Ray میزبان محلی DNS را نمایش می دهد.

{% hint style='info' %}

هنگامی که `"localhost"` استفاده می شود، ترافیک در حال انجام DNS توسط V2Ray کنترل نمی شود. با این وجود، شما می توانید پرس و جوهای DNS را با تنظیمات اضافی به V2Ray هدایت کنید.

{% endhint %}

> `clientIp`: string

آدرس آی پی دستگاه فعلی. اگر مشخص شود، V2Ray از این IP به عنوان EDNS-Client-Subnet استفاده می کند. این IP نمی تواند یک آدرس خصوصی باشد.

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