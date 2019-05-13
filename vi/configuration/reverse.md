---
refcn: chapter_02/reverse
refen: configuration/reverse
---

# Proxy ngược

Proxy ngược là một tính năng tùy chọn trong V2Ray. Nó chuyển hướng lưu lượng truy cập từ máy chủ đến máy khách. Vì vậy, được gọi là "Reverse" proxy.

{% hint style='tip' %}

Proxy ngược có sẵn trong V2Ray 4.0+. Nó hiện đang trong giai đoạn thử nghiệm và có thể được cải thiện trong tương lai gần.

{% endhint %}

Proxy ngược hoạt động theo cách sau:

* Giả sử có một thiết bị A chạy một máy chủ web. Thiết bị A không có địa chỉ IP công khai và không thể truy cập được từ internet. Có một thiết bị B khác, nói một máy chủ đám mây, có thể truy cập từ internet. Chúng ta cần sử dụng B làm cổng thông tin, để chuyển hướng traffice sang A.
* Bây giờ chúng tôi cài đặt V2Ray trên thiết bị A, có tên là `bridge`. Và sau đó cài đặt V2Ray trên thiết bị B, có tên là `cổng`.
* `cầu` sẽ mở các kết nối tới `cổng`. Mục tiêu của họ có thể được tùy chỉnh cho mục đích định tuyến. `cổng` sẽ nhận các kết nối này, cũng như các kết nối từ các ứng dụng khác trên internet. `cổng` sẽ "kết nối" hai loại kết nối này. Sau đó, giao thông interent sẽ được tunneled `cầu`.
* Sau khi `cầu` nhận lưu lượng truy cập từ internet thông qua `cổng`, nó sẽ gửi lưu lượng truy cập đến máy chủ web trên máy chủ cục bộ. Bạn cũng có thể định cấu hình định tuyến cho các lưu lượng truy cập này.
* `cầu` sẽ kiểm soát cân bằng tải dựa trên lượng lưu lượng truy cập.

{% hint style='danger' %}

Proxy ngược đã tận dụng [Mux](mux.md). Nó không phải là cần thiết để cấu hình Mux một lần nữa trên đường đi của nó.

{% endhint %}

## ReverseObject

`ReverseObject` được sử dụng làm `ngược` trong cấu hình mức cao nhất.

```javascript
{
  "bridges": [{
    "tag": "bridge",
    "domain": "test.v2ray.com"
  }],
  "portals": [{
    "tag": "portal",
    "domain": "test.v2ray.com"
  }]
}
```

> `bridges`: \[[BridgeObject](bridgeobject)\]

Một mảng `cầu`s. Mỗi `cầu` là [BridgeObject](bridgeobject).

> `portals`: \[[PortalObject](portalobject)\]

Một mảng `cổng`s. Mỗi cổng `` là [PortalObject](bridgeobject).

### BridgeObject

```javascript
{
  "tag": "bridge",
  "domain": "test.v2ray.com"
}
```

> `tag`: string

Một thẻ. Tất cả lưu lượng khởi xướng của thành viên này `cầu` sẽ có thẻ này. Nó có thể được sử dụng cho [định tuyến](routing.md), được xác định là `inboundTag`.

> `domain`: string

Tên miền. Tất cả các kết nối được khởi tạo bởi `cầu` hướng tới `cổng` sẽ sử dụng tên miền này làm mục tiêu. Tên miền này chỉ được sử dụng để liên lạc giữa `cầu` và `cổng`. Nó không phải là cần thiết để được thực sự đăng ký.

### PortalObject

> `tag`: string

Thẻ. Bạn cần phải chuyển hướng tất cả lưu lượng truy cập đến cổng thông tin `này`, bằng cách nhắm mục tiêu `outboundTag` đến thẻ `này`. Lưu lượng truy cập bao gồm các kết nối từ `cầu`, cũng như lưu lượng truy cập internet.

> `domain`: string

Tên miền. Khi một kết nối nhắm mục tiêu tên miền này, `cổng` xem xét nó là một kết nối từ `cầu`, nếu không nó là một kết nối internet.

{% hint style='tip' %}

Giống như tập quán khác, một trường hợp V2Ray có thể được sử dụng như một `cầu`hoặc `cổng`, hoặc cả hai như cùng một lúc.

{% endhint %}

## Cấu hình ví dụ

`cầu` thường cần hai outbounds. Một để kết nối `cổng`và một cho kết nối máy chủ web cục bộ.

Đảo ngược:

```javascript
{
  "bridges": [{
    "tag": "bridge",
    "domain": "test.v2ray.com"
  }]
}
```

Outbound:

```javascript
{
  "tag": "out"
  "protocol": "freedom",
  "settings": {
    "redirect": "127.0.0.1:80" // Send traffic to local web server
  }
},
{
  "protocol": "vmess",
  "settings": {
    "vnext": [{
      "address": "portal的IP地址",
      "port": 1024,
      "users": [{"id": "27848739-7e62-4138-9fd3-098a63964b6b"}]
    }]
  },
  "tag": "interconn"
}
```

Định tuyến:

```javascript
"routing": {
  "rules": [{
    "type": "field",
    "inboundTag": ["bridge"],
    "domain": ["full:test.v2ray.com"],
    "outboundTag": "interconn"
  },{
    "type": "field",
    "inboundTag": ["bridge"],
    "outboundTag": "out"
  }]
}
```

`cổng thông tin` thường cần hai giới hạn. Một cho các kết nối từ `cầu`và một cho kết nối internet.

Đảo ngược:

```javascript
{
  "portals": [{
    "tag": "portal",
    "domain": "test.v2ray.com"  // Must be the same as in bridge
  }]
}
```

Trong nước:

```javascript
{
  "tag": "external",
  "port": 80,  // Open port 80 for internet HTTP traffic
  "protocol": "dokodemo-door",
  "settings": {
    "address": "127.0.0.1",
    "port": 80,
    "network": "tcp"
  }
},
{
  "port": 1024, // For bridge connections
  "tag": "interconn",
  "protocol": "vmess",
  "settings": {
    "clients": [{"id": "27848739-7e62-4138-9fd3-098a63964b6b"}]
  }
}
```

Định tuyến:

```javascript
"routing": {
  "rules": [{
    "type": "field",
    "inboundTag": ["external"],
    "outboundTag": "portal"
  },{
    "type": "field",
    "inboundTag": ["interconn"],
    "outboundTag": "portal"
  }]
}
```

{% hint style='tip' %}

Trong thực tế, bạn có thể muốn chạy `cầu` đầu tiên và sau đó là `cổng`.

{% endhint %}