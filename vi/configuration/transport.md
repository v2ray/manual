---
refcn: chapter_02/05_transport
refen: configuration/transport
---
# Cài đặt Giao thông

Giao thông vận tải là cách V2Ray gửi và nhận dữ liệu từ các đồng nghiệp của nó. Trách nhiệm của một phương tiện vận chuyển là chuyển dữ liệu một cách đáng tin cậy đến một người ngang hàng. Thông thường một kết nối có các kết nối phù hợp trên cả hai điểm cuối. Ví dụ, nếu một V2Ray outbound sử dụng WebSocket như là vận chuyển của nó, thì nó nói đến cũng phải sử dụng WebSocket, nếu không kết nối không thể được thiết lập.

Cài đặt vận chuyển chia thành hai phần: cài đặt chung và mỗi cài đặt proxy. Cài đặt từng proxy xác định cách mỗi proxy riêng xử lý dữ liệu của nó, trong khi cài đặt chung cho tất cả proxy. Thông thường, các proxy gửi đến và gửi đi giữa peer peer phải có cùng các thiết lập truyền tải. Khi proxy không có cài đặt truyền tải, cài đặt chung sẽ được áp dụng.

## TransportObject

`TransportObject` được sử dụng làm `vận tải` trong cấu hình mức cao nhất.

```javascript
{
  "tcpSettings": {},
  "kcpSettings": {},
  "wsSettings": {},
  "httpSettings": {},
  "dsSettings": {}
}
```

> `tcpSettings`: TcpObject

Cài đặt cho [TCP vận chuyển](transport/tcp.md).

> `kcpSettings`: KcpObject

Cài đặt cho [vận chuyển mKCP](transport/mkcp.md).

> `wsSettings`: WebSocketObject

Cài đặt cho [vận chuyển WebSocket](transport/websocket.md).

> `httpSettings`: HttpObject

Cài đặt cho [HTTP / 2](transport/h2.md).

> `dsSettings`: DomainSocketObject

Cài đặt cho [vận chuyển Socket miền](transport/domainsocket.md).

## StreamSettingsObject

Mỗi proxy gửi đến và gửi đi có thể có cài đặt truyền tải riêng, như được chỉ định trong trường `streamSettings` trong cấu hình cấp cao nhất.

```javascript
{
  "network": "tcp",
  "security": "none",
  "tlsSettings": {},
  "tcpSettings": {},
  "kcpSettings": {},
  "wsSettings": {},
  "httpSettings": {},
  "dsSettings": {},
  "sockopt": {
    "mark": 0,
    "tcpFastOpen": false,
    "tproxy": "off"
  }
}
```

> `network`: "tcp" | "kcp" | "ws" | "http" | "domainsocket"

Loại mạng của luồng truyền tải. Giá trị mặc định `"tcp"`.

> `security`: "none" | "tls"

Loại bảo mật. Lựa chọn là `"none"` (mặc định) không có bảo mật thêm, hoặc `"tls"` cho việc sử dụng [TLS](https://en.wikipedia.org/wiki/Transport_Layer_Security).

> `tlsSettings`: [TLSObject](#tlsobject)

Cài đặt TLS. TLS được cung cấp bởi Golang. Hỗ trợ tối đa TLS 1.2. DTLS không được hỗ trợ.

> `tcpSettings`: [TcpObject](transport/tcp.md)

Cấu hình truyền tải TCP cho proxy hiện tại. Chỉ có hiệu lực khi proxy sử dụng giao thức TCP. Cấu hình giống với cấu hình toàn cục.

> `kcpSettings`: KcpObject

Cấu hình truyền tải mKCP cho proxy hiện tại. Chỉ hiệu lực khi proxy sử dụng truyền tải mKCP. Cấu hình giống với cấu hình toàn cục.

> `wsSettings`: WebSocketObject

Cấu hình truyền tải WebSocket cho proxy hiện tại. Chỉ có hiệu lực khi proxy sử dụng vận chuyển WebSocket. Cấu hình giống với cấu hình toàn cục.

> `httpSettings`: HttpObject

Cấu hình truyền tải HTTP / 2 cho proxy hiện tại. Chỉ hiệu lực khi proxy sử dụng giao thức HTTP / 2. Cấu hình giống với cấu hình toàn cục.

> `dsSettings`: DomainSocketObject

Cấu hình vận chuyển socket miền cho proxy hiện tại. Chỉ có hiệu lực khi proxy sử dụng chuyển vùng socket.

> `sockopt`: SockoptObject

Tùy chọn ổ cắm cho các kết nối đến và đi.

### TLSObject

```javascript
{
  "serverName": "v2ray.com",
  "allowInsecure": false,
  "alpn": ["http/1.1"],
  "certificates": []
}
```

> `serverName`: string

Tên máy chủ (thường là tên miền) được sử dụng để xác thực TLS. Thông thường, điều này được sử dụng khi corressponding inbound / outbound sử dụng IP để giao tiếp.

> `alpn`: \[ string \]

Một chuỗi các chuỗi, để xác định giá trị ALPN trong việc bắt tay TLS. Giá trị mặc định là `["http / 1.1"]`.

> `allowInsecure`: true | false

Nếu `true`, V2Ray cho phép kết nối không an toàn tại máy khách TLS, ví dụ: máy chủ TLS sử dụng chứng chỉ không thể xác minh.

> `allowInsecureCiphers`: true | false

Whehter hoặc không cho phép các bộ mã hóa không an toàn. Theo mặc định TLS chỉ sử dụng các bộ mã hóa từ đặc tả TLS 1.3. Bật tùy chọn này để cho phép các bộ mã hóa có khóa RSA tĩnh.

> `certificates`: \[ [CertificateObject](#certificateobject) \]

Danh sách chứng chỉ TLS. Mỗi mục nhập là một chứng chỉ.

### CertificateObject

```javascript
{
  "usage": "encipherment",

  "certificateFile": "/path/to/certificate.crt",
  "keyFile": "/path/to/key.key",

  "certificate": [
    "-----BEGIN CERTIFICATE-----",
    "MIICwDCCAaigAwIBAgIRAO16JMdESAuHidFYJAR/7kAwDQYJKoZIhvcNAQELBQAw",
    "ADAeFw0xODA0MTAxMzU1MTdaFw0xODA0MTAxNTU1MTdaMAAwggEiMA0GCSqGSIb3",
    "DQEBAQUAA4IBDwAwggEKAoIBAQCs2PX0fFSCjOemmdm9UbOvcLctF94Ox4BpSfJ+",
    "3lJHwZbvnOFuo56WhQJWrclKoImp/c9veL1J4Bbtam3sW3APkZVEK9UxRQ57HQuw",
    "OzhV0FD20/0YELou85TwnkTw5l9GVCXT02NG+pGlYsFrxesUHpojdl8tIcn113M5",
    "pypgDPVmPeeORRf7nseMC6GhvXYM4txJPyenohwegl8DZ6OE5FkSVR5wFQtAhbON",
    "OAkIVVmw002K2J6pitPuJGOka9PxcCVWhko/W+JCGapcC7O74palwBUuXE1iH+Jp",
    "noPjGp4qE2ognW3WH/sgQ+rvo20eXb9Um1steaYY8xlxgBsXAgMBAAGjNTAzMA4G",
    "A1UdDwEB/wQEAwIFoDATBgNVHSUEDDAKBggrBgEFBQcDATAMBgNVHRMBAf8EAjAA",
    "MA0GCSqGSIb3DQEBCwUAA4IBAQBUd9sGKYemzwPnxtw/vzkV8Q32NILEMlPVqeJU",
    "7UxVgIODBV6A1b3tOUoktuhmgSSaQxjhYbFAVTD+LUglMUCxNbj56luBRlLLQWo+",
    "9BUhC/ow393tLmqKcB59qNcwbZER6XT5POYwcaKM75QVqhCJVHJNb1zSEE7Co7iO",
    "6wIan3lFyjBfYlBEz5vyRWQNIwKfdh5cK1yAu13xGENwmtlSTHiwbjBLXfk+0A/8",
    "r/2s+sCYUkGZHhj8xY7bJ1zg0FRalP5LrqY+r6BckT1QPDIQKYy615j1LpOtwZe/",
    "d4q7MD/dkzRDsch7t2cIjM/PYeMuzh87admSyL6hdtK0Nm/Q",
    "-----END CERTIFICATE-----"
  ],
  "key": [
    "-----BEGIN RSA PRIVATE KEY-----",
    "MIIEowIBAAKCAQEArNj19HxUgoznppnZvVGzr3C3LRfeDseAaUnyft5SR8GW75zh",
    "bqOeloUCVq3JSqCJqf3Pb3i9SeAW7Wpt7FtwD5GVRCvVMUUOex0LsDs4VdBQ9tP9",
    "GBC6LvOU8J5E8OZfRlQl09NjRvqRpWLBa8XrFB6aI3ZfLSHJ9ddzOacqYAz1Zj3n",
    "jkUX+57HjAuhob12DOLcST8np6IcHoJfA2ejhORZElUecBULQIWzjTgJCFVZsNNN",
    "itieqYrT7iRjpGvT8XAlVoZKP1viQhmqXAuzu+KWpcAVLlxNYh/iaZ6D4xqeKhNq",
    "IJ1t1h/7IEPq76NtHl2/VJtbLXmmGPMZcYAbFwIDAQABAoIBAFCgG4phfGIxK9Uw",
    "qrp+o9xQLYGhQnmOYb27OpwnRCYojSlT+mvLcqwvevnHsr9WxyA+PkZ3AYS2PLue",
    "C4xW0pzQgdn8wENtPOX8lHkuBocw1rNsCwDwvIguIuliSjI8o3CAy+xVDFgNhWap",
    "/CMzfQYziB7GlnrM6hH838iiy0dlv4I/HKk+3/YlSYQEvnFokTf7HxbDDmznkJTM",
    "aPKZ5qbnV+4AcQfcLYJ8QE0ViJ8dVZ7RLwIf7+SG0b0bqloti4+oQXqGtiESUwEW",
    "/Wzi7oyCbFJoPsFWp1P5+wD7jAGpAd9lPIwPahdr1wl6VwIx9W0XYjoZn71AEaw4",
    "bK4xUXECgYEA3g2o9WqyrhYSax3pGEdvV2qN0VQhw7Xe+jyy98CELOO2DNbB9QNJ",
    "8cSSU/PjkxQlgbOJc8DEprdMldN5xI/srlsbQWCj72wXxXnVnh991bI2clwt7oYi",
    "pcGZwzCrJyFL+QaZmYzLxkxYl1tCiiuqLm+EkjxCWKTX/kKEFb6rtnMCgYEAx0WR",
    "L8Uue3lXxhXRdBS5QRTBNklkSxtU+2yyXRpvFa7Qam+GghJs5RKfJ9lTvjfM/PxG",
    "3vhuBliWQOKQbm1ZGLbgGBM505EOP7DikUmH/kzKxIeRo4l64mioKdDwK/4CZtS7",
    "az0Lq3eS6bq11qL4mEdE6Gn/Y+sqB83GHZYju80CgYABFm4KbbBcW+1RKv9WSBtK",
    "gVIagV/89moWLa/uuLmtApyEqZSfn5mAHqdc0+f8c2/Pl9KHh50u99zfKv8AsHfH",
    "TtjuVAvZg10GcZdTQ/I41ruficYL0gpfZ3haVWWxNl+J47di4iapXPxeGWtVA+u8",
    "eH1cvgDRMFWCgE7nUFzE8wKBgGndUomfZtdgGrp4ouLZk6W4ogD2MpsYNSixkXyW",
    "64cIbV7uSvZVVZbJMtaXxb6bpIKOgBQ6xTEH5SMpenPAEgJoPVts816rhHdfwK5Q",
    "8zetklegckYAZtFbqmM0xjOI6bu5rqwFLWr1xo33jF0wDYPQ8RHMJkruB1FIB8V2",
    "GxvNAoGBAM4g2z8NTPMqX+8IBGkGgqmcYuRQxd3cs7LOSEjF9hPy1it2ZFe/yUKq",
    "ePa2E8osffK5LBkFzhyQb0WrGC9ijM9E6rv10gyuNjlwXdFJcdqVamxwPUBtxRJR",
    "cYTY2HRkJXDdtT0Bkc3josE6UUDvwMpO0CfAETQPto1tjNEDhQhT",
    "-----END RSA PRIVATE KEY-----"
  ]
}
```

> `usage`: "encipherment" | "verify" | "issue"

Mục đích của chứng chỉ. Giá trị mặc định `"encipherment"`. Lựa chọn là:

* `"encipherment"`: Chứng chỉ được sử dụng để xác thực và mã hóa TLS.
* `"verify"`: Chứng chỉ được sử dụng để xác thực chứng chỉ TLS từ đồng đẳng từ xa. Trong trường hợp này, chứng chỉ phải là chứng chỉ CA.
* `"issue"`: Chứng chỉ được sử dụng để phát hành các chứng chỉ khác. Trong trường hợp này, chứng chỉ phải là chứng chỉ CA.

{% hint style='info' %}

Trên Windows, bạn phải cài đặt chứng chỉ CA của mình vào hệ thống, để xác minh các chứng chỉ được cấp từ CA.

{% endhint %}

{% hint style='info' %}

Khi có một yêu cầu khách hàng mới, nói cho `` = `"v2ray.com"`, V2Ray sẽ tìm thấy một chứng chỉ cho `"v2ray.com"` đầu tiên. Nếu không tìm thấy, V2Ray sẽ cố gắng cấp chứng chỉ mới bằng cách sử dụng bất kỳ chứng chỉ hiện có nào mà `sử dụng` là `"vấn đề"` cho `"v2ray.com"`. Chứng chỉ mới hết hạn sau một giờ và sẽ được thêm vào nhóm chứng chỉ để sử dụng lại sau này.

{% endhint %}

> `certificateFile`: string

Đường dẫn tệp đến chứng chỉ. Nếu chứng chỉ được tạo bởi OpenSSL, đường dẫn kết thúc bằng ".crt".

{% hint style='info' %}

Sử dụng lệnh `v2ctl cert -ca` để tạo chứng chỉ CA mới.

{% endhint %}

> `certificate`: \[ string \]

Danh sách các chuỗi như nội dung của chứng chỉ. Xem ví dụ trên. Không được để trống `chứng chỉ` hoặc `chứng chỉ`.

> `keyFile`: string

Đường dẫn tệp tới khóa riêng tư. Nếu được tạo bởi OpenSSL, tệp thường kết thúc bằng ".key". Tệp khóa có mật khẩu không được hỗ trợ.

> `key`: \[ string \]

Danh sách các chuỗi như nội dung của khóa riêng. Xem ví dụ trên. Không được để trống `khóa` hoặc `keyFile`.

Khi `certificateFile` và `chứng chỉ` đều được điền vào. V2Ray sử dụng `certificateFile`. Tương tự cho `keyFile` và `phím`.

{% hint style='info' %}

Khi `sử dụng` là `"xác minh"`, cả `keyFile` và `khóa` có thể trống.

{% endhint %}

### SockoptObject

```javascript
{
  "mark": 0,
  "tcpFastOpen": false,
  "tproxy": "off"
}
```

> `mark`: number

Số nguyên. Nếu khác không, giá trị sẽ được đặt thành các kết nối ra ngoài thông qua tùy chọn socket SO_MARK. Cơ chế này chỉ áp dụng trên Linux và yêu cầu quyền CAP_NET_ADMIN.

> `tcpFastOpen`: true | false

Có hay không kích hoạt [TCP Fast Open](https://en.wikipedia.org/wiki/TCP_Fast_Open). Khi được đặt thành `true`, V2Ray bật TFO cho kết nối hiện tại. Khi được đặt thành `false`, V2Ray sẽ tắt TFO. Nếu mục nhập này không tồn tại, V2Ray sử dụng cài đặt mặc định từ hệ điều hành.

* Chỉ áp dụng trên các hệ điều hành sau: 
  * Windows 10 (1604) trở lên
  * Mac OS 10.11 / iOS 9 trở lên
  * Linux 3.16 trở lên: Được bật theo mặc định hệ thống.
* Áp dụng cho cả kết nối trong và ngoài nước.

> `tproxy`: "redirect" | "tproxy" | "off"

Có hay không bật proxy trong suốt trên Linux. Lựa chọn là:

* `"off"`: Giá trị mặc định. Không kích hoạt TProxy.
* `"chuyển hướng"`: Bật TProxy với chế độ Chuyển hướng. Hỗ trợ lưu lượng TCP / IPv4 và UDP.
* `"tproxy"`: Bật TProxy với chế độ TProxy. Hỗ trợ lưu lượng TCP và UDP.

Proxy trong suốt yêu cầu quyền root hoặc CAP \ _NET \ _ADMIN.

{% hint style='info' %}

Nếu `TProxy` không được đặt và `allowRedirect` được đặt trong [dokodemo-door](protocols/dokodemo.md), giá trị của `TProxy` sẽ được đặt thành `"chuyển hướng"` tự động.

{% endhint %}