---
refcn: chapter_02/01_overview
refen: configuration/overview
---
# Tổng quan về cấu hình

V2Ray chia sẻ cùng một cấu trúc cấu hình giữa phía máy chủ và phía máy khách được hiển thị như bên dưới. Cấu hình máy chủ và máy khách khác nhau trong các phần cụ thể.

Dưới đây là cấu trúc cấp cao nhất của cấu hình. Mỗi phần có định dạng riêng.

```javascript
{
  "log": {},
  "api": {},
  "dns": {},
  "stats": {},
  "routing": {},
  "policy": {},
  "inbounds": [],
  "outbounds": [],
  "transport": {}
}
```

> `log`: [LogObject](#logobject)

Đăng nhập cấu hình để kiểm soát đầu ra nhật ký.

> `api`: [ApiObject](api.md)

API RPC để điều khiển phiên bản V2Ray. Xem [cấu hình API](api.md) để biết chi tiết.

> `dns`: [DnsObject](dns.md)

Cấu hình cho cấu hình máy chủ DNS nội bộ. Nếu phần này bị bỏ qua, V2Ray sẽ sử dụng cấu hình DNS toàn hệ thống của bạn. Để biết chi tiết, xem [Cấu hình DNS](dns.md).

> `stats`: [StatsObject](stats.md)

Khi được chỉ định, nội bộ [Thống kê](stats.md) được bật.

> `policy`: [PolicyObject](policy.md)

Cấu hình cho quyền và các chiến lược bảo mật khác. Để biết chi tiết, xem [Chính sách địa phương](policy.md).

> `routing`: [RoutingObject](routing.md)

Cấu hình cho nội bộ [Định tuyến](routing.md) chiến lược.

> `inbounds`: \[ [InboundObject](#inboundobject) \]

Một mảng [InboundObject](#inboundobject) làm cấu hình cho proxy gửi đến.

> `outbounds`: \[ [OutboundObject](#outboundobject) \]

Một mảng [OutboundObject](#outboundobject) làm cấu hình cho các proxy gửi đi. Chuyến đi đầu tiên trong mảng là mảng chính. Đây là định tuyến mặc định trong định tuyến định tuyến.

> `transport`: [TransportObject](transport.md)

Cấu hình giao thức vận tải cấp thấp. Để biết chi tiết, xem [Giao thức Tùy chọn Giao vận](transport.md).

## LogObject

```javascript
{
  "access": "/path/to/file",
  "error": "/path/to/file",
  "loglevel": "warning"
}
```

> `access`: string

Đường dẫn để truy cập nhật ký. Nếu không trống, nó phải là một đường dẫn tập tin hợp pháp, chẳng hạn như `"/tmp/v2ray/_access.log"`(Linux) hoặc `"C: \\ Temp \\ v2ray \\ _ access.log"`(Windows ). Nếu trống, V2Ray ghi nhật ký truy cập vào `stdout`.

> `error`: string

Đường dẫn đến nhật ký lỗi. Nếu không trống, nó phải là một đường dẫn tập tin hợp pháp. Nếu trống, V2Ray ghi nhật ký lỗi tới `stdout`.

> `loglevel`: "debug" | "info" | "warning" | "error" | "none"

Mức nhật ký được ghi. Các cấp nhật ký khác nhau cho biết nội dung nhật ký khác nhau. Giá trị mặc định là `"cảnh báo"`.

Mức nhật ký:

* `"debug"`: Thông tin dành cho nhà phát triển. Cũng bao gồm tất cả `"thông tin"` bản ghi.
* `"thông tin"`: Thông tin về trạng thái hiện tại của V2Ray. Người dùng không phải chăm sóc những người đó. Cũng bao gồm tất cả `"cảnh báo"` bản ghi.
* `"cảnh báo"`: Đã xảy ra sự cố với môi trường, thường nằm ngoài V2Ray, ví dụ: mạng bị vỡ. V2Ray vẫn chạy nhưng người dùng có thể gặp phải một số sự cố. Cũng bao gồm tất cả `"lỗi"` bản ghi.
* `"lỗi"`: Đã xảy ra sự cố nghiêm trọng, V2Ray không thể chạy được.
* `"none"`: Tất cả ghi nhật ký đều bị tắt.

## InboundObject

Một InboundObject định nghĩa một proxy gửi đến. Nó xử lý các kết nối đến V2Ray. Proxy có sẵn được [liệt kê ở đây](protocols.md).

```javascript
{
  "port": 1080,
  "listen": "127.0.0.1",
  "protocol": "protocol_name",
  "settings": {},
  "streamSettings": {},
  "tag": "inbound_tag_name",
  "sniffing": {
    "enabled": false,
    "destOverride": ["http", "tls"]
  },
  "allocate": {
    "strategy": "always",
    "refresh": 5,
    "concurrency": 3
  },
}
```

> `port`: number | "env:variable" | string

Cổng mà proxy đang nghe. Các định dạng có thể chấp nhận là:

* Số nguyên: số cổng thực tế.
* Biến môi trường: Bắt đầu bằng `"env:"`, biến env chỉ định cổng ở định dạng chuỗi, chẳng hạn như `"env: PORT"`. V2Ray sẽ giải mã biến thành chuỗi.
* Chuỗi: Giá trị chuỗi số, chẳng hạn như `"1234"`hoặc một loạt các cổng, chẳng hạn như `"5-10"` cho tổng số 6 cổng.

Các cổng thực tế để mở cũng phụ thuộc vào `phân bổ` thiết lập. Xem bên dưới.

> `listen`: address

Địa chỉ cần nghe. Giá trị mặc định là `"0.0.0.0"` cho các kết nối đến trên tất cả các giao diện mạng. Nếu không, giá trị phải là địa chỉ của giao diện mạng hiện có.

> `protocol`: string

Tên của giao thức gửi đến. Xem từng cá nhân để biết các giá trị có sẵn.

> `settings`: InboundConfigurationObject

Cài đặt giao thức cụ thể. Xem `InboundConfigurationObject` được định nghĩa trong mỗi giao thức.

> `streamSettings`: [StreamSettingsObject]

Xem [Giao thức Giao thức Tùy chọn](transport.md) để biết chi tiết.

> `tag`: string

Thẻ của proxy đến. Nó có thể được sử dụng cho các quyết định định tuyến. Nếu không trống, nó phải là duy nhất trong số tất cả các proxy gửi đến.

> `sniffing`: [SniffingObject](#sniffingobject)

Cấu hình cho nội dung đánh hơi.

> `allocate`: [AllocateObject](#allocateobject)

Cấu hình cho cổng phân bổ.

### SniffingObject

```javascript
{
  "enabled": false,
  "destOverride": ["http", "tls"]
}
```

> `enabled`: true | false

Có hay không kích hoạt nội dung đánh hơi.

> `destOverride`: \["http" | "tls"\]

Một loại nội dung. Nếu loại nội dung của lưu lượng truy cập đến được chỉ định trong danh sách, đích của kết nối sẽ bị ghi đè bởi giá trị bị đánh hơi.

### AllocateObject

```javascript
{
  "strategy": "always",
  "refresh": 5,
  "concurrency": 3
}
```

> `strategy`: "always" | "random"

Chiến lược phân bổ cảng. Khi nó được đặt thành `"luôn luôn"`, tất cả cổng trong trường `cổng` sẽ được cấp phát để nghe. Nếu `"ngẫu nhiên"` được thiết lập, V2Ray sẽ nghe số `đồng thời` cổng và danh sách các cổng được giới thiệu sau mỗi `làm mới` phút.

> `refresh`: number

Số phút để làm mới các cổng nghe. Giá trị nhỏ nhất là `2`. Cài đặt này chỉ hiệu quả khi `chiến lược` được đặt thành `"ngẫu nhiên"`.

> `concurrency`: number

Số cổng để nghe. Giá trị nhỏ nhất là `1`. Giá trị tối đa là một phần ba toàn bộ phạm vi cổng.

## OutboundObject

An OutboundObject định nghĩa proxy gửi đi để xử lý các kết nối đang diễn ra. Các giao thức có sẵn được liệt kê [tại đây](protocols.md).

```javascript
{
  "sendThrough": "0.0.0.0",
  "protocol": "protocol_name",
  "settings": {},
  "tag": "this_outbound_tag_name",
  "streamSettings": {},
  "proxySettings": {
    "tag": "another_outbound_tag_name"
  },
  "mux": {}
}
```

> `sendThrough`: address

Địa chỉ IP để gửi lưu lượng truy cập. Giá trị mặc định, `"0.0.0.0"` là để chọn ngẫu nhiên một IP có sẵn trên máy chủ. Nếu không, giá trị phải là một địa chỉ IP từ các giao diện mạng hiện có.

> `protocol`: string

Tên giao thức của outbound này. Xem [Giao thức](protocols.md) cho tất cả các giá trị có sẵn.

> `settings`: OutboundConfigurationObject

Cài đặt giao thức cụ thể. Xem `OutboundConfigurationObject` trong mỗi giao thức riêng lẻ.

> `tag`: string

Thẻ của lối ra này. Nếu không trống, nó phải là duy nhất trong số tất cả các giới hạn.

> `streamSettings`: [StreamSettingsObject](transport.md)

Cài đặt vận chuyển ở mức độ thấp. Xem [Giao thức Giao thức Tùy chọn](transport.md).

> `proxySettings`: [ProxySettingsObject](#proxysettingsobject)

Cấu hình cho ủy quyền lưu lượng truy cập từ này đi khác. Khi điều này được thiết lập, `streamSettings` của outbound này sẽ không có hiệu lực.

> `mux`: [MuxObject](mux.md)

Xem cấu hình [Mux](mux.md) để biết chi tiết.

### ProxySettingsObject

```javascript
{
  "tag": "another-outbound-tag"
}
```

> `tag`: string

Khi `thẻ` được đặt thành thẻ của một kênh khác, lưu lượng truy cập ra ngoài hiện tại sẽ được chuyển đến thẻ được chỉ định.