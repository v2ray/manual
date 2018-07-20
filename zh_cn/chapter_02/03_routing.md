# 路由功能

[![English][1]][2] [![German][3]][4] [![Russian][5]][6]

[1]: ../resources/english.svg
[2]: https://www.v2ray.com/en/configuration/routing.html
[3]: ../resources/german.svg
[4]: https://www.v2ray.com/de/configuration/routing.html
[5]: ../resources/russian.svg
[6]: https://www.v2ray.com/ru/configuration/routing.html

V2Ray 内建了一个简单的路由功能，可以将传入数据按需求由不同的传出连接发出，以达到按需代理的目的。这一功能的常见用法是分流国内外流量，V2Ray 可以通过内部机制判断不同地区的流量，然后将它们发送到不同的传出代理。

配置格式如下：

```javascript
{
  "strategy": "rules",
  "settings": {
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
}
```

其中：

* `strategy`: 目前只有`"rules"`这一个选项。
* `domainStrategy`: 域名解析策略，可选的值有：
  * `"AsIs"`: 只使用域名进行路由选择。默认值。
  * `"IPIfNonMatch"`: 当域名没有匹配任何规则时，将域名解析成 IP（A 记录或 AAAA 记录）再次进行匹配；
    * 当一个域名有多个 A 记录时，会尝试匹配所有的 A 记录，直到其中一个与某个规则匹配为止；
    * 解析后的 IP 仅在路由选择时起作用，转发的数据包中依然使用原始域名；
  * `"IPOnDemand"`: 当匹配时碰到任何基于 IP 的规则，将域名立即解析为 IP 进行匹配；
* `rules`: 对应一个数组，数组中每个一个元素是一个规则。对于每一个连接，路由将根据这些规则依次进行判断，当一个规则生效时，即将这个连接转发至它所指定的`outboundTag`。

每一个规则的详细格式如下：

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
    "10.0.0.1"
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

其中：

* `type`: 目前只支持`"field"`。
* `domain`: 一个数组，数组每一项是一个域名的匹配。有四种形式：
  * 纯字符串: 当此字符串匹配目标域名中任意部分，该规则生效。比如"sina.com"可以匹配"sina.com"、"sina.com.cn"和"www.sina.com"，但不匹配"sina.cn"。
  * 正则表达式: 由"regexp:"开始，余下部分是一个正则表达式。当此正则表达式匹配目标域名时，该规则生效。例如"regexp:\\\\.goo.*\\\\.com$"匹配"www.google.com"、"fonts.googleapis.com"，但不匹配"google.com"。
  * 子域名: 由"domain:"开始，余下部分是一个域名。当此域名是目标域名或其子域名时，该规则生效。例如"domain:v2ray.com"匹配"www.v2ray.com"、"v2ray.com"，但不匹配"xv2ray.com"。
  * 常用国内域名: 特殊值`"geosite:cn"`，内置了一些[常见的国内网站域名](https://www.v2ray.com/links/chinasites/)。
  * 从文件中加载域名 (V2Ray 3.23+): 形如`"ext:file:tag"`，必须以`ext:`（小写）开头，后面跟文件名和标签，文件存放在[资源目录](env.md#asset-location)中，文件格式与`geosite.dat`相同，标签必须在文件中存在。
* `ip`: 一个数组，数组内每一个元素代表一个 IP 范围。当某一元素匹配目标 IP 时，此规则生效。有三种形式：
  * IP: 形如`"127.0.0.1"`。
  * [CIDR](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing)
  * GeoIP: 形如`"geoip:cn"`，必须以`geoip:`（小写）开头，后面跟双字符国家代码，支持几乎所有可以上网的国家。
    * 特殊值：`"geoip:private"` (V2Ray 3.5+)，包含所有私有地址，如`127.0.0.1`。
  * 从文件中加载 IP (V2Ray 3.23+): 形如`"ext:file:tag"`，必须以`ext:`（小写）开头，后面跟文件名和标签，文件存放在[资源目录](env.md#asset-location)中，文件格式与`geoip.dat`相同标签必须在文件中存在。
* `port`：端口范围，有两种形式：
  * `"a-b"`: a 和 b 均为正整数，且小于 65536。这个范围是一个前后闭合区间，当目标端口落在此范围内时，此规则生效。
  * `a`: a 为正整数，且小于 65536。当目标端口为 a 时，此规则生效。
* `network`: 可选的值有"tcp"、"udp"或"tcp,udp"，当连接方式是指定的方式时，此规则生效。
* `source`: 一个数组，数组内每一个元素是一个 IP 或 CIDR。当某一元素匹配来源 IP 时，此规则生效。
* `user`: 一个数组，数组内每一个元素是一个邮箱地址。当某一元素匹配来源用户时，此规则生效。当前 Shadowsocks 和 VMess 支持此规则。
* `inboundTag`: 一个数组，数组内每一个元素是一个标识。当某一元素匹配传入协议的标识时，此规则生效。
* `protocol`: 一个数组，数组内每一个元素表示一种协议。当某一个协议匹配当前连接的流量时，此规则生效。
  * 可选的值有`"http"`、`"tls"`、`"bittorrent"`，均为小写。
  * 必须开启传入代理中的`sniffing`选项。
* `outboundTag` 对应一个[额外传出连接配置](02_protocols.md)的标识。

## 小贴士 {#tips}

* 当多个属性同时指定时，这些属性需要同时满足，才可以使当前规则生效；
  * 如果多个规则分别使用了`domain`或者`ip`，需要对应添加多条规则；
* `"ext:geoip.dat:cn"`等价于`"geoip:cn"`。
* 域名匹配模式中，推荐使用子域名模式（即以"domain:"开头）。
