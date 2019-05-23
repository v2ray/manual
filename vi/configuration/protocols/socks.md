---
refcn: chapter_02/protocols/socks
refen: configuration/protocols/socks
---

# Socks

* Tên: `vớ`
* Loại: Inbound / Outbound

Socks là một thực hiện giao thức SOCKS chuẩn, tương thích với [Socks 4](http://ftp.icm.edu.pl/packages/socks/socks4/SOCKS4.protocol), Socks 4a và [Socks 5](http://ftp.icm.edu.pl/packages/socks/socks4/SOCKS4.protocol).

Cấu hình Socks bao gồm hai phần, `InboundConfigurationObject` và `OutboundConfigurationObject`, cho tương ứng trong và ngoài.

## OutboundConfigurationObject

`OutboundConfigurationObject` được sử dụng làm trường `cài đặt` trong `OutboundObject` trong cấu hình mức cao nhất.

```javascript
{
  "servers": [{
    "address": "127.0.0.1",
    "port": 1234,
    "users": [
      {
        "user": "test user",
        "pass": "test pass",
        "level": 0
      }
    ]
  }]
}
```

> `servers`: \[ [ServerObject](#serverobject) \]

Một loạt các máy chủ Socks.

### ServerObject

```javascript
{
  "address": "127.0.0.1",
  "port": 1234,
  "users": [
    {
      "user": "test user",
      "pass": "test pass",
      "level": 0
    }
  ]
}
```

> `address`: address

Vớ địa chỉ máy chủ. Có thể là IPv4, IPv6 hoặc địa chỉ miền.

{% hint style='info' %}

Chỉ hỗ trợ Socks 5 servers.

{% endhint %}

> `port`: number

Vớ cổng máy chủ.

> `users`: \[ [UserObject](#userobject) \]

Một mảng người dùng. Mỗi phần tử trong mảng là một người dùng. Nếu danh sách không trống. Socks inbound sẽ buộc người dùng xác thực. Nếu không, người dùng ẩn danh được cho phép.

### UserObject

```javascript
{
  "user": "test user",
  "pass": "test pass",
  "level": 0
}
```

> `user`: string

Tên người dùng như trong giao thức Socks

> `pass`: string

Mật khẩu như trong giao thức Socks

> `level`: number

Cấp người dùng cho mục đích theo dõi và chính sách. Giá trị mặc định là `0`.

## InboundConfigurationObject

```javascript
{
  "auth": "noauth",
  "accounts": [
    {
      "user": "my-username",
      "pass": "my-password"
    }
  ],
  "udp": false,
  "ip": "127.0.0.1",
  "userLevel": 0
}
```

> `auth`: "noauth" | "password"

Vớ phương pháp xác thực. `"noauth"` dành cho xác thực ẩn danh và `"mật khẩu"` để xác thực bằng tên người dùng và mật khẩu. Giá trị mặc định là `"noauth"`.

> `accounts`: \[ [AccountObject](#accountobject) \]

Một loạt tài khoản người dùng, cho mục đích tự động. Chỉ có hiệu lực khi `auth` được đặt thành `"password"`.

> `udp`: true | false

Có hay không kích hoạt UDP. Giá trị mặc định là `false`.

> `ip`: address

Khi UDP được bật, V2Ray cần biết địa chỉ IP của máy chủ hiện tại. Giá trị mặc định là `"127.0.0.1"`. Điều này phải được đặt thành địa chỉ IP công khai của máy chủ lưu trữ, nếu bạn muốn cho phép lưu lượng truy cập UDP công khai.

> `userLevel`: number

Cấp người dùng. Tất cả các kết nối đến đều chia sẻ cấp độ người dùng này.

### AccountObject

```javascript
{
  "user": "my-username",
  "pass": "my-password"
}
```

> `user`: string

Tên người dùng như trong giao thức Socks

> `pass`: string

Mật khẩu như trong giao thức Socks