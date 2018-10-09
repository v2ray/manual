---
refcn: chapter_02/04_dns
refen: configuration/dns
---

# DNS 服务器

V2Ray 内置了一个 DNS 服务器，可以将 DNS 查询根据路由设置转发到不同的远程服务器中。

{% hint style='info' %}
由于 DNS 协议的复杂性，V2Ray 只支持最基本的 IP 查询（A 和 AAAA 记录）。推荐使用本机 DNS 配合一个额外的 DNS 服务器来做 DNS 查询，如 [CoreDNS](https://coredns.io/)，以使用完整的 DNS 功能。
{% endhint %}

示例配置：

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

其中：

* `hosts`: 静态 IP 列表，其值为一系列的"域名":"IP"，IP 可以是 IPv4 或者 IPv6。在解析域名时，如果域名匹配这个列表中的某一项，则解析结果为该项的 IP，而不会使用下述的 servers 进行解析。域名的格式如下：
  * 形如 `"v2ray.com"`: 被解析的域名需要和此域名完全一致；
  * 形如 `"domain:v2ray.com"`: 被解析的域名可以是此域名或是其子域名。
* `servers`: 指定一个 DNS 服务器列表，支持两种格式: 
  * 基本格式: 一个字符串，如`"8.8.8.8"`，表示一个端口为`53`的 DNS 服务器。当值为`"localhost"`时，表示使用本机预设的 DNS 配置。
  * 完整格式 (V2Ray 3.42+):
    * `address`: DNS 服务器地址，如`"8.8.8.8"`。
    * `port`: DNS 服务器端口，如`53`。
    * `domains`: 一个域名列表，此列表包含的域名，将优先使用此服务器进行查询。域名格式和路由配置中相同。
* `clientIp`: 当前系统的 IP 地址，用于 DNS 查询时，通知服务器客户端的所在位置。不能是私有地址。

若要使 DNS 服务生效，需要配置路由功能中的 `domainStrategy`。

{% hint style='tip' %}
由此 DNS 服务器所发出的 DNS 查询请求，会自动根据路由配置进行转发，无需额外配置。
{% endhint %}

## 小贴士 {#tips}

* 当使用 localhost 时，本机的 DNS 请求不受 V2Ray 控制，需要额外的配置才可以使 DNS 请求由 V2Ray 转发。
* 当某个 DNS 服务器指定的域名列表匹配了当前要查询的域名，V2Ray 会优先使用这个 DNS 服务器进行查询，否则按从上往下的顺序进行查询。
