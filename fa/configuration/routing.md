---
refcn: chapter_02/03_routing
refen: configuration/routing
---
# مسیریابی

V2Ray دارای مکانیزم مسیریابی داخلی است. این ارتباطات ورودی به خروجی های مختلف را براساس قوانین انجام می دهد. یک سناریو معمول این است که تقسیم ترافیک به وسیله کشور انجام شود. V2Ray می تواند کشور مقصد (توسط Geo IP) یک اتصال را شناسایی کند و سپس اتصال به پروکسی خروجی مربوطه را ارسال کند.

## RoutingObject

`RoutingObject` به عنوان `مسیریابی` در پیکربندی سطح بالا استفاده می شود.

```javascript
{
  "domainStrategy": "AsIs",
  "rules": [],
  "balancers": []
}
```

> `domainStrategy`: "AsIs" | "IPIfNonMatch" | "IPOnDemand"

استراتژی قطعنامه دامنه انتخاب ها عبارتند از:

* `"AsIs"`: فقط از دامنه برای مسیریابی استفاده کنید. مقدار پیش فرض.
* `"IPIfNonMatch"`: زمانی که هیچ قاعده ای با دامنه فعلی منطبق نیست، V2Ray آن را به آدرس های IP (A یا AAAA) رفع می کند و دوباره تمام قوانین را امتحان می کند. 
  * اگر یک دامنه دارای چندین آدرس IP باشد، V2Ray تمام آنها را انجام می دهد.
  * IP های حل شده تنها برای تصمیم گیری مسیریابی استفاده می شوند، ترافیک هنوز به آدرس دامنه اصلی ارسال می شود.
* `"IPOnDemand"`: تا زمانی که یک قانون مبتنی بر IP وجود دارد، V2Ray بلافاصله دامنه را به IP حل خواهد کرد.

> `قوانین`: \ [[RuleObject](#ruleobject)\]

An array of rules. For each inbound connection, V2Ray tries these rules from top down one by one. If a rule takes effect, the connection will be routed to the `outboundTag` (or `balancerTag`, V2Ray 4.4+) of the rule.

> `balancers`: \[ [BalancerObject](#balancerobject) \]

(V2Ray 4.4+) An array of load balancers. When a routing rule points to a load balancer, the balancer will select an outbound based on configuration. Then traffic will be sent to that outbound.

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
  "attrs": "attrs[':method'] == 'GET'",
  "outboundTag": "direct",
  "balancerTag": "balancer"
}
```

{% hint style='info' %}

When multiple fields are specified, these fields have to be all satisfied, in order to make the rule effective. If you need both `domain` and `ip` rules, it is highly likely you need put them into separate rules.

{% endhint %}

> `type`: "field"

The only valid value for now is `"field"`.

> `domain`: \[ string \]

An array of domains. Available formats are:

* متن ساده: اگر این رشته با هر بخش از دامنه هدفمندی منطبق باشد، این قانون به عهده می گیرد. مثال: rule `"sina.com"` مطابقت دامنه `"sina.com"`، `"sina.com.cn"` و `"www.sina.com"`، اما نه `"sina.cn"`.
* عبارت منظم: شروع با `"regexp:"`، بقیه یک عبارت منظم است. هنگامی که Regexp با هدف دامنه مطابقت می کند، این قانون به اجرا در می آید. مثال: rule `"regexp: \\. goo. * \\. com $"` برابر `"www.google.com"` و `"fonts.googleapis.com"`، اما نه `"google.com"`.
* Subdomain (توصیه می شود): شروع با `"domain:"` و بقیه یک دامنه است. هنگامی که دامنه هدفمند دقیقا همان مقدار است یا یک زیر دامنه از مقدار است، این قانون در حال اجرا است. مثال: قانون `"دامنه: v2ray.com"` مسابقه `"www.v2ray.com"`، `"v2ray.com"`، اما نه `"xv2ray.com"`.
* دامنه کامل: شروع با `"full:"` و بقیه یک دامنه است. هنگامی که دامنه هدفمند دقیقا همان ارزش است، این قانون اثر می گذارد. مثال: قانون `"دامنه: v2ray.com"` مطابق با `"v2ray.com"`، اما نه `"www.v2ray.com"`.
* Pre-defined domain list: Begining with `"geosite:"` and the rest is a name, such as `geosite:google` or `geosite:cn`. See [Pre-defined domain list](#pre-defined-domain-lists) for more detail.
* Domains from file: Such as `"ext:file:tag"`. The value must begin with `ext:` (lowercase), and followed by filename and tag. The file is placed in [resource directory](env.md#location-of-v2ray-asset), and has the same format of `geosite.dat`. The tag must exist in the file.

> `ip`: \[string\]

An array of IP ranges. When the targeting IP is in one of the ranges, this rule takes effect. Available formats:

* IP: مانند `"127.0.0.1"`.
* [CIDR](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing): مانند `"127.0.0.0/8"`.
* GeoIP: مانند `"geoip: cn"`. با شروع می شود `geoip:` (حروف کوچک) و دو حرف از کد کشور را دنبال می کند. 
  * مقدار ویژه `"geoip: خصوصی"`: برای تمام آدرس های خصوصی مانند `127.0.0.1`.
* IP ها از فایل: مانند `"ext: file: tag"`. مقدار باید با `ext:` (کوچک) شروع شود و با نام فایل و تگ همراه است. فایل در قرار داده شده [دایرکتوری منبع](env.md#location-of-v2ray-asset)، و همان فرمت از `geoip.dat`. برچسب باید در فایل موجود باشد.

{% hint style='info' %}

`"ext:geoip.dat:cn"` is equivalent to `"geoip:cn"`.

{% endhint %}

> `port`：number | string

Port range. Formats are:

* `"a-b"`: Both `a` and `b` are positive integers and less than 65536. When the targeting port is in [`a`, `b`), this rule takes effect.
* `a`: `a` is a positive integer, and less than 65536. When the targeting port is `a`, this rule takes effect.
* Mix of the two above, separated by ",". Such as `"53,443,1000-2000"`.

> `network`: "tcp" | "udp" | "tcp,udp"

When the connection has in the chosen network, this rule take effect.

> `source`: \[string\]

An array of IP ranges. Same format as `ip`. When the source IP of the connection is in the IP range, this rule takes effect.

> `user`: \[string\]

An array of email address. When the inbound connection uses an user account of the email address, this rule takes effect. For now Shadowsocks and VMess support user with email.

> `inboundTag`: \[string\]

An array of string as inbound proxy tags. When the connection comes from one of the specified inbound proxy, this rule takes effect.

> `protocol`: \[ "http" | "tls" | "bittorrent" \]

An array of string as protocol types. When the connection uses one of the protocols, this rule takes effect. To recognize the protocol of a connection, one must enable `sniffing` option in inbound proxy.

> `attrs`: string

(V2Ray 4.18+) A Starlark script, used for detecting traffic attributes. When this script returns true, this rule takes effect.

[Starlark](https://github.com/bazelbuild/starlark) is a subset of Python. The script takes a global varible named `attrs`. It contains all attributes of the traffic.

At the moment, only http inbound sets `attrs`.

Examples:

* Detect HTTP GET: `"attrs[':method'] == 'GET'"`
* Detect HTTP Path: `"attrs[':path'].startswith('/test')"`
* Detect Content Type: `"attrs['content-type'].index('text/html') >= 0"`

> `outboundTag` string

[Tag of the outbound](protocols.md) that the connection will be sent to, if this rule take effect.

> `balancerTag`: string

Tag of an load balancer. Then this rule takes effect, V2Ray will use the balancer to select an outbound. Either `outboundTag` or `balancerTag` must be specified. When both are specified, `outboundTag` takes priority.

### BalancerObject

Configuration for a load balancer. When a load balancer takes effective, it selects one outbound from matching outbounds. This outbound will be used for send out-going traffic.

```javascript
{
  "tag": "balancer",
  "selector": []
}
```

> `tag`: string

Tag of this `BalancerObject`, to be matched from `balancerTag` in `RuleObject`.

> `selector`: \[ string \]

An array of strings. These strings are used to select outbounds with prefix matching. For example, with the following outbound tags: `[ "a", "ab", "c", "ba" ]`，selector `["a"]` matches `[ "a", "ab" ]`.

When multiple outbounds are selected, load balancer for now picks one final outbound at random.

## Pre-defined domain lists

This is a domain lists maintained by [domain-list-community](https://github.com/v2ray/domain-list-community) project. It provides a file named `geosite.dat` for some predefined domain lists. Notably:

* `category-ads`: Common ads domains.
* `category-ads-all`: Common ads domains and ads providers' domains.
* `cn`: Equivalent to an union of `geolocation-cn` and `tld-cn`.
* `google`: All Google domains.
* `facebook`: All Facebook domains.
* `geolocation-cn`: Common domains that serve in China.
* `geolocation-!cn`: Common domains that don't serve in China
* `speedtest`: All domains used by Speedtest.
* `tld-cn`: All .cn and .中国 domains.