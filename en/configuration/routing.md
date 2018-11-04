---
refcn: chapter_02/03_routing
refen: configuration/routing
---

# Routing

V2Ray has an internal routing mechanism. It routes inbound connections to various outbound based on rules. A common scenario is to split traffic by country. V2Ray can detect target country (by Geo IP) of a connection, and sends then connection to corresponding outbound proxy.

Configuration:

```javascript
{
  "domainStrategy": "AsIs",
  "rules": [
    {
      "type": "field",
      "domain": [
        "baidu.com",
        "qq.com"
      ],
      "outboundTag": "direct"
    }
  ]
}
```

Where:

* `domainStrategy`: Domain resolution strategy. Choices are:
  * `"AsIs"`: Only use domain for routing. Default value.
  * `"IPIfNonMatch"`: When no rule matches current domain, V2Ray resolves it into IP addresses (A or AAAA records) and try all rules again.
    * If a domain has multiple IP addresses, V2Ray tries all of them.
    * The resolved IPs are only used for routing decisions, the traffic is still sent to original domain address.
  * `"IPOnDemand"`: As long as there is a IP-based rule, V2Ray resolves the domain into IP immediately.
* `rules`: An array of rules. For each inbound connection, V2Ray tries these rules from top down one by one. If a rule takes effect, the connection will be routed to the `outboundTag` of the rule.

Configuration for each rule:

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

Where:

* `type`: The only valid value for now is `"field"`.
* `domain`: An array of domains. There are four formats:
  * Substring: If this string matches any part of the targeting domain, this rule takes effet. Example: rule `"sina.com"` matches targeting domain `"sina.com"`, `"sina.com.cn"` and `"www.sina.com"`, but not `"sina.cn"`.
  * Regular expression: Begining with `"regexp:"`, the rest is a regular expression. When the regexp matches targeting domain, this rule takes effect. Example: rule `"regexp:\\.goo.*\\.com$"` matches `"www.google.com"` and `"fonts.googleapis.com"`, but not `"google.com"`.
  * Subdomain (recommended): Begining with `"domain:"` and the rest is a domain. When the targeting domain is exactly the value, or is a subdomain of the value, this rule takes effect. Example: rule `"domain:v2ray.com"` matches `"www.v2ray.com"`, `"v2ray.com"`, but not `"xv2ray.com"`.
  * Full domain (V2Ray 3.36+): Begining with `"full:"` and the rest is a domain. When the targeting domain is exactly the value, the rule takes effect. Example: rule `"domain:v2ray.com"` matches `"v2ray.com"`, but not `"www.v2ray.com"`.
  * Special value `"geosite:cn"`: a list of [common domains in China](https://www.v2ray.com/links/chinasites/).
  * Special value `"geosite:speedtest"` (V2Ray 3.32+): list of all public servers of speedtest.net.
  * Domains from file (V2Ray 3.23+): Such as `"ext:file:tag"`. The value must begin with `ext:` (lowercase), and followed by filename and tag. The file is placed in [resource directory](env.md#location-of-v2ray-asset), and has the same format of `geosite.dat`. The tag must exist in the file.
* `ip`: An array of IP ranges. When the targeting IP is in one of the ranges, this rule takes effect. There are three formats:
  * IP: such as `"127.0.0.1"`.
  * [CIDR](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing): such as `"127.0.0.0/8"`.
  * GeoIP: such as `"geoip:cn"`. It begins with `geoip:` (lower case) and followed by two letter of country code.
    * Special value `"geoip:private"`: for all private addresses such as `127.0.0.1`.
  * IPs from file (V2Ray 3.23+): Such as `"ext:file:tag"`. The value must begin with `ext:` (lowercase), and followed by filename and tag. The file is placed in [resource directory](env.md#location-of-v2ray-asset), and has the same format of `geoip.dat`. The tag must exist in the file.
* `port`：Port range. Formats are:
  * `"a-b"`: Both `a` and `b` are positive integers and less than 65536. When the targeting port is in [`a`, `b`), this rule takes effect.
  * `a`: `a` is a positive integer, and less than 65536. When the targeting port is `a`, this rule takes effect.
* `network`: Choices are `"tcp"`, `"udp"`, or `"tcp,udp"`. When the connection has in the chosen network, this rule take effect.
* `source`: An array of IP ranges. Same format as `ip`. When the source IP of the connection is in the IP range, this rule takes effect.
* `user`: An array of email address. When the inbound connection uses an user account of the email address, this rule takes effect. For now  Shadowsocks and VMess support user with email.
* `inboundTag`: An array of string as inbound proxy tags. When the connection comes from one of the specified inbound proxy, this rule takes effect.
* `protocol`: An array of string as protocol types. When the connection uses one of the protocols, this rule takes effect.
  * Available values are `"http"`,`"tls"`,`"bittorrent"`. All lower-cased.
  * `sniffing` in inbound proxy must be enabled in advance.
* `outboundTag` [Tag of the outbound](protocols.md) that the connection will be sent to, if this rule take effect.

## Tips {#tips}

* When multiple attributes of the rule are specified, they must be satisfied together, in order to make the rule effective.
  * If you want to route connections by `domain` or `ip`, you probably need multiple rules, instead of one rule containing both `domain` and `ip`.
* `"ext:geoip.dat:cn"` is equivalent to `"geoip:cn"`.
* Among all domain matching modes, subdomain (beginning with "domain:") is recommended.
* When none of the rules are satisfied, traffic will be sent out through the main outbound proxy.
