---
refcn: chapter_02/03_routing
refen: configuration/routing
---

# 路由功能

V2Ray 内建了一个简单的路由功能，可以将入站数据按需求由不同的出站连接发出，以达到按需代理的目的。这一功能的常见用法是分流国内外流量，V2Ray 可以通过内部机制判断不同地区的流量，然后将它们发送到不同的出站代理。

## RoutingObject

`RoutingObject` 对应主配置文件中的`routing`项。

```javascript
{
  "domainStrategy": "AsIs",
  "rules": [],
  "balancers": []
}
```

> `domainStrategy`: "AsIs" | "IPIfNonMatch" | "IPOnDemand"

域名解析策略，根据不同的设置使用不同的策略。

* `"AsIs"`: 只使用域名进行路由选择。默认值。
* `"IPIfNonMatch"`: 当域名没有匹配任何规则时，将域名解析成 IP（A 记录或 AAAA 记录）再次进行匹配；
  * 当一个域名有多个 A 记录时，会尝试匹配所有的 A 记录，直到其中一个与某个规则匹配为止；
  * 解析后的 IP 仅在路由选择时起作用，转发的数据包中依然使用原始域名；
* `"IPOnDemand"`: 当匹配时碰到任何基于 IP 的规则，将域名立即解析为 IP 进行匹配；

> `rules`: \[[RuleObject](#ruleobject)\]

对应一个数组，数组中每个元素是一个规则。对于每一个连接，路由将根据这些规则依次进行判断，当一个规则生效时，即将这个连接转发至它所指定的`outboundTag`(或`balancerTag`，V2Ray 4.4+)。当没有匹配到任何规则时，流量默认由主出站协议发出。

> `balancers`: \[ [BalancerObject](#balancerobject) \]

(V2Ray 4.4+)一个数组，数组中每个元素是一个负载均衡器的配置。当一个规则指向一个负载均衡器时，V2Ray 会通过此负载均衡器选出一个出站协议，然后由它转发流量。

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
  "port": "53,443,1000-2000",
  "network": "tcp",
  "source": [
    "10.0.0.1"
  ],
  "user": [
    "love@v2ray.com"
  ],
  "inboundTag": [
    "tag-vmess"
  ],
  "protocol":["http", "tls", "bittorrent"],
  "outboundTag": "direct",
  "balancerTag": "balancer"
}
```

{% hint style='info' %}
当多个属性同时指定时，这些属性需要同时满足，才可以使当前规则生效。如果多个规则分别使用了`domain`或者`ip`，需要对应添加多条规则。
{% endhint %}

> `type`: "field"

目前只支持`"field"`这一个选项。

> `domain`: \[string\]

一个数组，数组每一项是一个域名的匹配。有以下几种形式：

* 纯字符串: 当此字符串匹配目标域名中任意部分，该规则生效。比如"sina.com"可以匹配"sina.com"、"sina.com.cn"和"www.sina.com"，但不匹配"sina.cn"。
* 正则表达式: 由`"regexp:"`开始，余下部分是一个正则表达式。当此正则表达式匹配目标域名时，该规则生效。例如"regexp:\\\\.goo.*\\\\.com$"匹配"www.google.com"、"fonts.googleapis.com"，但不匹配"google.com"。
* 子域名 (推荐): 由`"domain:"`开始，余下部分是一个域名。当此域名是目标域名或其子域名时，该规则生效。例如"domain:v2ray.com"匹配"www.v2ray.com"、"v2ray.com"，但不匹配"xv2ray.com"。
* 完整匹配: 由`"full:"`开始，余下部分是一个域名。当此域名完整匹配目标域名时，该规则生效。例如"full:v2ray.com"匹配"v2ray.com"但不匹配"www.v2ray.com"。
* 特殊值`"geosite:cn"`: 内置了一些[常见的国内网站域名](https://www.v2ray.com/links/chinasites/)。
* 特殊值`"geosite:speedtest"` (V2Ray 3.32+): Speedtest.net 的所有公用服务器列表。
* 从文件中加载域名: 形如`"ext:file:tag"`，必须以`ext:`（小写）开头，后面跟文件名和标签，文件存放在[资源目录](env.md#asset-location)中，文件格式与`geosite.dat`相同，标签必须在文件中存在。

> `ip`: \[string\]

一个数组，数组内每一个元素代表一个 IP 范围。当某一元素匹配目标 IP 时，此规则生效。有以下几种形式：

* IP: 形如`"127.0.0.1"`。
* [CIDR](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing): 形如`"10.0.0.0/8"`.
* GeoIP: 形如`"geoip:cn"`，必须以`geoip:`（小写）开头，后面跟双字符国家代码，支持几乎所有可以上网的国家。
  * 特殊值：`"geoip:private"` (V2Ray 3.5+)，包含所有私有地址，如`127.0.0.1`。
* 从文件中加载 IP: 形如`"ext:file:tag"`，必须以`ext:`（小写）开头，后面跟文件名和标签，文件存放在[资源目录](env.md#asset-location)中，文件格式与`geoip.dat`相同标签必须在文件中存在。

{% hint style='info' %}
`"ext:geoip.dat:cn"`等价于`"geoip:cn"`
{% endhint %}

> `port`：number | string

端口范围，有三种形式：

* `"a-b"`: a 和 b 均为正整数，且小于 65536。这个范围是一个前后闭合区间，当目标端口落在此范围内时，此规则生效。
* `a`: a 为正整数，且小于 65536。当目标端口为 a 时，此规则生效。
* (V2Ray 4.18+) 以上两种形式的混合，以逗号","分隔。形如：`"53,443,1000-2000"`。

> `network`: "tcp" | "udp" | "tcp,udp"

可选的值有"tcp"、"udp"或"tcp,udp"，当连接方式是指定的方式时，此规则生效。

> `source`: \[string\]

一个数组，数组内每一个元素是一个 IP 或 CIDR。当某一元素匹配来源 IP 时，此规则生效。

> `user`: \[string\]

一个数组，数组内每一个元素是一个邮箱地址。当某一元素匹配来源用户时，此规则生效。当前 Shadowsocks 和 VMess 支持此规则。

> `inboundTag`: \[string\]

一个数组，数组内每一个元素是一个标识。当某一元素匹配入站协议的标识时，此规则生效。

> `protocol`: \[ "http" | "tls" | "bittorrent" \]

一个数组，数组内每一个元素表示一种协议。当某一个协议匹配当前连接的流量时，此规则生效。必须开启入站代理中的`sniffing`选项。

> `outboundTag`: string

对应一个[额外出站连接配置](02_protocols.md)的标识。

> `balancerTag`: string

对应一个负载均衡器的标识。`balancerTag`和`outboundTag`须二选一。当同时指定时，`outboundTag`生效。

### BalancerObject

负载均衡器配置。当一个负载均衡器生效时，它会从指定的出站协议中，按配置选出一个最合适的出站协议，进行流量转发。

```javascript
{
  "tag": "balancer",
  "selector": []
}
```

> `tag`: string

此负载均衡器的标识，用于匹配`RuleObject`中的`balancerTag`。

> `selector`: \[ string \]

一个字符串数组，其中每一个字符串将用于和出站协议标识的前缀匹配。在以下几个出站协议标识中：`[ "a", "ab", "c", "ba" ]`，`"selector": ["a"]`将匹配到`[ "a", "ab" ]`。

如果匹配到多个出站协议，负载均衡器目前会从中随机选出一个作为最终的出站协议。
