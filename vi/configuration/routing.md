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
  "rules": []
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

Một loạt các quy tắc. Đối với mỗi kết nối gửi đến, V2Ray cố gắng các quy tắc này từ trên xuống từng cái một. Nếu quy tắc có hiệu lực, kết nối sẽ được định tuyến tới `outboundTag` của quy tắc.

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
  "outboundTag": "direct"
}
```

{% hint style='info' %}

Khi nhiều trường được chỉ định, các trường này phải được thỏa mãn, để làm cho quy tắc có hiệu quả. Nếu bạn cần cả hai quy tắc `tên miền` và `ip` , rất có khả năng bạn cần đặt chúng vào các quy tắc riêng biệt.

{% endhint %}

> `type`: "field"

Giá trị hợp lệ duy nhất cho bây giờ là `"trường"`.

> `domain`: \[ string \]

Một mảng các miền. Các định dạng có sẵn là:

* Plaintext: Nếu chuỗi này khớp với bất kỳ phần nào của miền nhắm mục tiêu, quy tắc này sẽ có hiệu lực. Ví dụ: quy tắc `"sina.com"` phù hợp với nhắm mục tiêu tên miền `"sina.com"`, `"sina.com.cn"` và `"www.sina.com"`, nhưng không phải `"sina.cn"`.
* Cụm từ thông dụng: Bắt đầu bằng `"regexp:"`, phần còn lại là cụm từ thông dụng. Khi regexp khớp với miền nhắm mục tiêu, quy tắc này có hiệu lực. Ví dụ: quy tắc `"regexp: \\. Goo. * \\. Com $"` khớp với `"www.google.com"` và `"fonts.googleapis.com"`, nhưng không phải `"google.com"`.
* Tên miền phụ (được khuyến nghị): Bắt đầu bằng `"tên miền:"` và phần còn lại là tên miền. Khi tên miền nhắm mục tiêu chính xác là giá trị hoặc là tên miền phụ của giá trị, quy tắc này có hiệu lực. Ví dụ: quy tắc `"tên miền: v2ray.com"` khớp với `"www.v2ray.com"`, `"v2ray.com"`, nhưng không phải `"xv2ray.com"`.
* Tên miền đầy đủ: Bắt đầu bằng `"đầy đủ:"` và phần còn lại là tên miền. Khi tên miền nhắm mục tiêu chính xác là giá trị, quy tắc sẽ có hiệu lực. Ví dụ: quy tắc `"tên miền: v2ray.com"` khớp với `"v2ray.com"`, nhưng không phải `"www.v2ray.com"`.
* Giá trị đặc biệt `"geosite: cn"`: danh sách [tên miền phổ biến ở Trung Quốc](https://www.v2ray.com/links/chinasites/).
* Giá trị đặc biệt `"geosite: speedtest"` (V2Ray 3.32+): danh sách tất cả các máy chủ công cộng của speedtest.net.
* Tên miền từ tệp: Chẳng hạn như `"ext: file: tag"`. Giá trị phải bắt đầu bằng `ext:` (chữ thường) và tiếp theo là tên tệp và thẻ. Tệp được đặt trong [thư mục tài nguyên](env.md#location-of-v2ray-asset)và có cùng định dạng `geosite.dat`. Thẻ phải tồn tại trong tệp.

> `ip`: \[string\]

Một dãy các dải IP. Khi IP nhắm mục tiêu nằm trong một trong các phạm vi, quy tắc này có hiệu lực. Định dạng có sẵn:

* IP: chẳng hạn như `"127.0.0.1"`.
* [CIDR](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing): chẳng hạn như `"127.0.0.0/8"`.
* GeoIP: chẳng hạn như `"geoip: cn"`. Nó bắt đầu với `geoip:` (chữ thường) và theo sau là hai chữ cái của mã quốc gia. 
  * Giá trị đặc biệt `"geoip: private"`: cho tất cả các địa chỉ riêng như `127.0.0.1`.
* IP từ tệp: Chẳng hạn như `"ext: file: tag"`. Giá trị phải bắt đầu bằng `ext:` (chữ thường) và tiếp theo là tên tệp và thẻ. Tệp được đặt trong [thư mục tài nguyên](env.md#location-of-v2ray-asset)và có cùng định dạng `geoip.dat`. Thẻ phải tồn tại trong tệp.

{% hint style='info' %}

`"ext: geoip.dat: cn"` tương đương với `"geoip: cn"`.

{% endhint %}

> `cổng`： số | chuỗi

Port range. Định dạng là:

* `"ab"`: Cả `a` và `b` là số nguyên dương và nhỏ hơn 65536. Khi cổng nhắm mục tiêu nằm trong [`a`, `b`), quy tắc này có hiệu lực.

* `một`: `một` là một số nguyên dương, và ít hơn 65536. Khi cổng nhắm mục tiêu là `một`, quy tắc này có hiệu lực.

> `network`: "tcp" | "udp" | "tcp,udp"

Khi kết nối có trong mạng đã chọn, quy tắc này có hiệu lực.

> `source`: \[string\]

Một dãy các dải IP. Cùng định dạng với `ip`. Khi IP nguồn của kết nối nằm trong dải IP, quy tắc này có hiệu lực.

> `user`: \[string\]

Một mảng địa chỉ email. Khi kết nối gửi đến sử dụng tài khoản người dùng của địa chỉ email, quy tắc này có hiệu lực. Hiện tại Shadowsocks và VMess hỗ trợ người dùng bằng email.

> `inboundTag`: \[string\]

Một mảng chuỗi như thẻ proxy đến. Khi kết nối đến từ một trong các proxy được chỉ định, quy tắc này có hiệu lực.

> `protocol`: \[ "http" | "tls" | "bittorrent" \]

Một mảng chuỗi như là các loại giao thức. Khi kết nối sử dụng một trong các giao thức, quy tắc này có hiệu lực. Để nhận ra giao thức của kết nối, bạn phải bật tùy chọn `ngửi` trong proxy đến.

> `outboundTag` chuỗi

[Thẻ của đường đi](protocols.md) mà kết nối sẽ được gửi đến, nếu quy tắc này có hiệu lực.