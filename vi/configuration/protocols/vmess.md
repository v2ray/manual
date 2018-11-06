---
refcn: chapter_02/protocols/vmess
refen: configuration/protocols/vmess
---
# VMess

* Tên: `vmess`
* Loại: Inbound / Outbound

[VMess](https://www.v2ray.com/eng/protocols/vmess.html) là một giao thức cho truyền thông được mã hóa. Nó bao gồm cả proxy trong và ngoài.

VMess phụ thuộc vào thời gian hệ thống. Hãy đảm bảo rằng thời gian hệ thống của bạn được đồng bộ với thời gian UTC. Múi giờ không quan trọng. Người ta có thể cài đặt dịch vụ `ntp` trên Linux để tự động điều chỉnh thời gian hệ thống.

## OutboundConfigurationObject

```javascript
{
  "vnext": [
    {
      "address": "127.0.0.1",
      "port": 37192,
      "users": [
        {
          "id": "27848739-7e62-4138-9fd3-098a63964b6b",
          "alterId": 16,
          "security": "auto",
          "level": 0
        }
      ]
    }
  ]
}
```

> `vnext`: \[ [ServerObject](#serverobject) \]

Một mảng, trong đó mỗi phần tử trình bày một máy chủ từ xa

### ServerObject

```javascript
{
  "address": "127.0.0.1",
  "port": 37192,
  "users": []
}
```

> `address`: address

Địa chỉ máy chủ, có thể là IPv4, IPv6 hoặc tên miền.

> `port`: number

Cổng máy chủ

> `users`: \[ [UserObject](#userobject) \]

Một mảng trong đó mỗi phần tử là một người dùng VMess

### UserObject

```javascript
{
  "id": "27848739-7e62-4138-9fd3-098a63964b6b",
  "alterId": 16,
  "security": "auto",
  "level": 0
}
```

> `id`: string

ID người dùng, ở dạng [UUID](https://en.wikipedia.org/wiki/Universally_unique_identifier).

> `alterId`: number

Số ID thay thế. Các ID thay thế sẽ được tạo theo cách xác định. Mặc định là 0. Tối đa 65535. Đề nghị 16. Giá trị của nó không được lớn hơn giá trị của một Inbound tương ứng.

> `level`: number

Cấp người dùng. Xem [Chính sách](../policy.md) để biết thêm chi tiết.

> `security`: "aes-128-gcm" | "chacha20-poly1305" | "auto" | "none"

Phương pháp mã hóa tải trọng. Cài đặt này chỉ khả dụng ở bên ngoài. VMess inbound sẽ tự động nhận ra thiết lập này và giải mã payload cho phù hợp. Các tùy chọn là:

* `"aes-128-gcm"`: Được khuyến nghị cho PC.
* `"chacha20-poly1305"`: Được đề xuất cho thiết bị di động.
* `"auto"`: Giá trị mặc định. Sử dụng `aes-128-gcm` trên AMD64, ARM64 và S390x hoặc `chacha20-poly1305` nếu không.
* `"none"`: Giao thông không được mã hóa.

{% hint style='info' %}

Sử dụng `"auto"` bất cứ nơi nào có thể để tương thích tốt hơn.

{% endhint %}

## InboundConfigurationObject

```javascript
{
  "clients": [
    {
      "id": "27848739-7e62-4138-9fd3-098a63964b6b",
      "level": 0,
      "alterId": 100,
      "email": "love@v2ray.com"
    }
  ],
  "default": {
    "level": 0,
    "alterId": 32
  },
  "detour": {
    "to": "tag_to_detour"
  },
  "disableInsecureEncryption": false
}
```

> `clients`: \[ [ClientObject](#clientobject) \]

Một mảng cho các tài khoản người dùng hợp lệ. Có thể trống khi được sử dụng cho tính năng cổng động.

> `detour`: [DetourObject](#detourobject)

Tính năng tùy chọn để đề xuất khách hàng sử dụng đường vòng. Nếu được chỉ định, nội dung này sẽ hướng dẫn bên ngoài sử dụng một thư đến khác.

> `default`: [DefaultObject](#defaultobject)

Cấu hình máy khách mặc định tùy chọn. Thường được sử dụng với `đường vòng`.

> `disableInsecureEncryption`: true | false

Ngăn cấm khách hàng sử dụng các phương thức mã hóa không an toàn. Khi được đặt thành `true`, các kết nối sẽ bị chấm dứt ngay lập tức nếu sử dụng mã hóa sau. Giá trị mặc định `sai`.

* `không ai`
* `aes-128-cfb`

### ClientObject

```javascript
{
  "id": "27848739-7e62-4138-9fd3-098a63964b6b",
  "level": 0,
  "alterId": 16,
  "email": "love@v2ray.com"
}
```

> `id`: string

ID người dùng, ở dạng [UUID](https://en.wikipedia.org/wiki/Universally_unique_identifier).

> `level`: number

Cấp người dùng. Xem [Chính sách](../policy.md) để biết cách sử dụng.

> `alterId`: number

Số ID thay thế. Giống như trong Outbound.

> `email`: string

Địa chỉ email để nhận dạng người dùng.

### DetourObject

```javascript
{
  "to": "tag_to_detour"
}
```

> `to`: string

Thẻ của proxy đến. Xem [Tổng quan](../protocols.md). Nếu được cấu hình, VMess sẽ đề xuất ứng dụng khách của nó để sử dụng đường vòng cho các kết nối khác.

### DefaultObject

```javascript
{
  "level": 0,
  "alterId": 32
}
```

> `level`: number

Cấp người dùng.

> `alterId`: number

Số ID thay thế. Giá trị mặc định 64. Đề xuất 16.