---
refcn: chapter_02/03_routing
refen: configuration/routing
---

# Routing

V2Ray has an internal routing mechanism. It routes inbound connections to various outbound based on rules. A common scenario is to split traffic by country. V2Ray can detect target country (by Geo IP) of a connection, and sends then connection to corresponding outbound proxy.

## RoutingObject

`RoutingObject` is used as `routing` in top level configuration.

```javascript
{
  "domainStrategy": "AsIs",
  "rules": []
}
```

> `domainStrategy`: "AsIs" | "IPIfNonMatch" | "IPOnDemand"

Domain resolution strategy. Choices are:

* `"AsIs"`: Only use domain for routing. Default value.
* `"IPIfNonMatch"`: When no rule matches current domain, V2Ray resolves it into IP addresses (A or AAAA records) and try all rules again.
  * If a domain has multiple IP addresses, V2Ray tries all of them.
  * The resolved IPs are only used for routing decisions, the traffic is still sent to original domain address.
* `"IPOnDemand"`: As long as there is a IP-based rule, V2Ray resolves the domain into IP immediately.

> `rules`: \[[RuleObject](#ruleobject)\]

An array of rules. For each inbound connection, V2Ray tries these rules from top down one by one. If a rule takes effect, the connection will be routed to the `outboundTag` of the rule.

### RuleObject

```javascript
{
  "type": "field",
  "domain": [
    "baidu.com",
    "qq.com",
    "geosite:cn"
  ],
  "ip": [
    "0.0.0.0/8",
    "10.0.0.0/8",
    "fc00::/7",
    "fe80::/10",
    "geoip:cn"
  ],
  "port": "0-100",
  "network": "tcp",
  "source": [
    "10.0.0.1",
  ],
  "user": [
    "love@v2ray.com"
  ],
  "inboundTag": [
    "tag-vmess"
  ],
  "protocol":["http", "tls", "bittorrent"],
  "outboundTag": "direct"
}
```

{% hint style='info' %}
When multiple fields are specified, these fields have to be all satisfied, in order to make the rule effective. If you need both `domain` and `ip` rules, it is highly likely you need put them into separate rules.
{% endhint %}

> `type`: "field"

The only valid value for now is `"field"`.

> `domain`: \[ string \]

An array of domains. Available formats are:

* Plaintext: If this string matches any part of the targeting domain, this rule takes effet. Example: rule `"sina.com"` matches targeting domain `"sina.com"`, `"sina.com.cn"` and `"www.sina.com"`, but not `"sina.cn"`.
* Regular expression: Begining with `"regexp:"`, the rest is a regular expression. When the regexp matches targeting domain, this rule takes effect. Example: rule `"regexp:\\.goo.*\\.com$"` matches `"www.google.com"` and `"fonts.googleapis.com"`, but not `"google.com"`.
* Subdomain (recommended): Begining with `"domain:"` and the rest is a domain. When the targeting domain is exactly the value, or is a subdomain of the value, this rule takes effect. Example: rule `"domain:v2ray.com"` matches `"www.v2ray.com"`, `"v2ray.com"`, but not `"xv2ray.com"`.
* Full domain: Begining with `"full:"` and the rest is a domain. When the targeting domain is exactly the value, the rule takes effect. Example: rule `"domain:v2ray.com"` matches `"v2ray.com"`, but not `"www.v2ray.com"`.
* Special value `"geosite:cn"`: a list of [common domains in China](https://www.v2ray.com/links/chinasites/).
* Special value `"geosite:speedtest"` (V2Ray 3.32+): list of all public servers of speedtest.net.
* Domains from file: Such as `"ext:file:tag"`. The value must begin with `ext:` (lowercase), and followed by filename and tag. The file is placed in [resource directory](env.md#location-of-v2ray-asset), and has the same format of `geosite.dat`. The tag must exist in the file.

> `ip`: \[string\]

An array of IP ranges. When the targeting IP is in one of the ranges, this rule takes effect. Available formats:

* IP: such as `"127.0.0.1"`.
* [CIDR](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing): such as `"127.0.0.0/8"`.
* GeoIP: such as `"geoip:cn"`. It begins with `geoip:` (lower case) and followed by two letter of country code.
  * Special value `"geoip:private"`: for all private addresses such as `127.0.0.1`.
* IPs from file: Such as `"ext:file:tag"`. The value must begin with `ext:` (lowercase), and followed by filename and tag. The file is placed in [resource directory](env.md#location-of-v2ray-asset), and has the same format of `geoip.dat`. The tag must exist in the file.

{% hint style='info' %}
`"ext:geoip.dat:cn"` is equivalent to `"geoip:cn"`.
{% endhint %}

> `port`：number | string

Port range. Formats are:

* `"a-b"`: Both `a` and `b` are positive integers and less than 65536. When the targeting port is in [`a`, `b`), this rule takes effect.

* `a`: `a` is a positive integer, and less than 65536. When the targeting port is `a`, this rule takes effect.

> `network`: "tcp" | "udp" | "tcp,udp"

When the connection has in the chosen network, this rule take effect.

> `source`: \[string\]

An array of IP ranges. Same format as `ip`. When the source IP of the connection is in the IP range, this rule takes effect.

> `user`: \[string\]

An array of email address. When the inbound connection uses an user account of the email address, this rule takes effect. For now  Shadowsocks and VMess support user with email.

> `inboundTag`: \[string\]

An array of string as inbound proxy tags. When the connection comes from one of the specified inbound proxy, this rule takes effect.

> `protocol`: \[ "http" | "tls" | "bittorrent" \]

An array of string as protocol types. When the connection uses one of the protocols, this rule takes effect. To recognize the protocol of a connection, one must enable `sniffing` option in inbound proxy.

> `outboundTag` string

[Tag of the outbound](protocols.md) that the connection will be sent to, if this rule take effect.
