---
refcn: chapter_02/03_routing
refen: configuration/routing
---
# định tuyến

V2Ray có cơ chế định tuyến nội bộ. Nó định tuyến các kết nối gửi đến nhiều hướng đi khác nhau dựa trên các quy tắc. Một tình huống phổ biến là chia lưu lượng truy cập theo quốc gia. V2Ray có thể phát hiện quốc gia mục tiêu (theo địa lý IP) của một kết nối và sau đó gửi kết nối tới proxy đi tương ứng.

## RoutingObject

`RoutingObject` is used as `routing` in top level configuration.

```javascript
{
  "domainStrategy": "AsIs",
  "rules": [],
  "balancers": []
}
```

> `domainStrategy`: "AsIs" | "IPIfNonMatch" | "IPOnDemand"

Chiến lược phân giải miền. Lựa chọn là:

* `"AsIs"`: Chỉ sử dụng miền để định tuyến. Giá trị mặc định.
* `"IPIfNonMatch"`: Khi không có quy tắc nào khớp với miền hiện tại, V2Ray sẽ giải quyết nó thành địa chỉ IP (bản ghi A hoặc AAAA) và thử lại tất cả các quy tắc. 
  * Nếu một miền có nhiều địa chỉ IP, V2Ray sẽ thử tất cả các địa chỉ đó.
  * Các IP được giải quyết chỉ được sử dụng cho các quyết định định tuyến, lưu lượng truy cập vẫn được gửi đến địa chỉ tên miền ban đầu.
* `"IPOnDemand"`: Miễn là có quy tắc dựa trên IP, V2Ray sẽ giải quyết miền đó thành IP ngay lập tức.

> `rules`: \[[RuleObject](#ruleobject)\]

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

* Plaintext: Nếu chuỗi này khớp với bất kỳ phần nào của miền nhắm mục tiêu, quy tắc này sẽ có hiệu lực. Ví dụ: quy tắc `"sina.com"` phù hợp với nhắm mục tiêu tên miền `"sina.com"`, `"sina.com.cn"` và `"www.sina.com"`, nhưng không phải `"sina.cn"`.
* Cụm từ thông dụng: Bắt đầu bằng `"regexp:"`, phần còn lại là cụm từ thông dụng. Khi regexp khớp với miền nhắm mục tiêu, quy tắc này có hiệu lực. Ví dụ: quy tắc `"regexp: \\. Goo. * \\. Com $"` khớp với `"www.google.com"` và `"fonts.googleapis.com"`, nhưng không phải `"google.com"`.
* Tên miền phụ (được khuyến nghị): Bắt đầu bằng `"tên miền:"` và phần còn lại là tên miền. Khi tên miền nhắm mục tiêu chính xác là giá trị hoặc là tên miền phụ của giá trị, quy tắc này có hiệu lực. Ví dụ: quy tắc `"tên miền: v2ray.com"` khớp với `"www.v2ray.com"`, `"v2ray.com"`, nhưng không phải `"xv2ray.com"`.
* Tên miền đầy đủ: Bắt đầu bằng `"đầy đủ:"` và phần còn lại là tên miền. Khi tên miền nhắm mục tiêu chính xác là giá trị, quy tắc sẽ có hiệu lực. Ví dụ: quy tắc `"tên miền: v2ray.com"` khớp với `"v2ray.com"`, nhưng không phải `"www.v2ray.com"`.
* Giá trị đặc biệt `"geosite: cn"`: danh sách [tên miền phổ biến ở Trung Quốc](https://www.v2ray.com/links/chinasites/).
* Giá trị đặc biệt `"geosite: speedtest"` (V2Ray 3.32+): danh sách tất cả các máy chủ công cộng của speedtest.net.
* Tên miền từ tệp: Chẳng hạn như `"ext: file: tag"`. Giá trị phải bắt đầu bằng `ext:` (chữ thường) và tiếp theo là tên tệp và thẻ. Tệp được đặt trong [thư mục tài nguyên](env.md#location-of-v2ray-asset)và có cùng định dạng `geosite.dat`. Thẻ phải tồn tại trong tệp.

> `ip`: \[string\]

An array of IP ranges. When the targeting IP is in one of the ranges, this rule takes effect. Available formats:

* IP: chẳng hạn như `"127.0.0.1"`.
* [CIDR](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing): chẳng hạn như `"127.0.0.0/8"`.
* GeoIP: chẳng hạn như `"geoip: cn"`. Nó bắt đầu với `geoip:` (chữ thường) và theo sau là hai chữ cái của mã quốc gia. 
  * Giá trị đặc biệt `"geoip: private"`: cho tất cả các địa chỉ riêng như `127.0.0.1`.
* IP từ tệp: Chẳng hạn như `"ext: file: tag"`. Giá trị phải bắt đầu bằng `ext:` (chữ thường) và tiếp theo là tên tệp và thẻ. Tệp được đặt trong [thư mục tài nguyên](env.md#location-of-v2ray-asset)và có cùng định dạng `geoip.dat`. Thẻ phải tồn tại trong tệp.

{% hint style='info' %}

`"ext:geoip.dat:cn"` is equivalent to `"geoip:cn"`.

{% endhint %}

> `port`：number | string

Port range. Formats are:

* `"ab"`: Cả `a` và `b` là số nguyên dương và nhỏ hơn 65536. Khi cổng nhắm mục tiêu nằm trong [`a`, `b`), quy tắc này có hiệu lực.

* `một`: `một` là một số nguyên dương, và ít hơn 65536. Khi cổng nhắm mục tiêu là `một`, quy tắc này có hiệu lực.

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