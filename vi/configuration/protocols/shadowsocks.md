---
refcn: chapter_02/protocols/shadowsocks
refen: configuration/protocols/shadowsocks
---
# Shadowsocks

* Tên: `bóng`
* Loại: Inbound / Outbound

[Giao thức Shadowsocks](https://www.shadowsocks.org/) , cho cả kết nối trong và ngoài.

Khả năng tương thích với phiên bản chính thức:

* Hỗ trợ cả kết nối TCP và UDP, trong đó UDP có thể được tắt tùy chọn.
* Hỗ trợ [OTA](https://web.archive.org/web/20161221022225/https://shadowsocks.org/en/spec/one-time-auth.html)； 
  * Khách hàng có thể chọn bật hoặc tắt.
  * Máy chủ có thể chọn bật, tắt hoặc tự động.
* Phương thức mã hóa ([AEAD](https://shadowsocks.org/en/spec/AEAD-Ciphers.html) mật mã được thêm vào trong V2Ray 3.0): 
  * aes-256-cfb
  * aes-128-cfb
  * chacha20
  * chacha20-ietf
  * aes-256-gcm
  * aes-128-gcm
  * chacha20-poly1305 aka chacha20-ietf-poly1305
* Bổ sung: 
  * Hỗ trợ obfs thông qua chế độ độc lập.

## InboundConfigurationObject

```javascript
{
  "email": "love@v2ray.com",
  "method": "aes-128-cfb",
  "password": "password",
  "level": 0,
  "ota": true,
  "network": "tcp"
}
```

> `email`: string

Địa chỉ email. Được sử dụng để nhận dạng người dùng.

> `method`: string

Cần thiết. Xem [Phương thức mã hóa](#encryption-methods) để biết các giá trị có sẵn.

> `password`: string

Cần thiết. Mật khẩu trong giao thức Shadowsocks. Có thể là bất kỳ chuỗi nào.

> `level`: number

Cấp người dùng. Mặc định là `0`. Xem [Chính sách](../policy.md).

> `ota`: `true` | `false`

Có hay không ép buộc OTA. Nếu `true` và kết nối đến không bật OTA, V2Ray sẽ từ chối kết nối này. Ngược lại.

Nếu trường này không được chỉ định, V2Ray sẽ tự động phát hiện cài đặt OTA từ các kết nối đến.

Khi mã hóa AEAD được sử dụng, `ota` không có hiệu lực.

> `network`: "tcp" | "udp" | "tcp,udp"

Loại mạng được hỗ trợ. Mặc định là `"tcp"`.

## OutboundConfigurationObject

```javascript
{
  "servers": [
    {
      "email": "love@v2ray.com",
      "address": "127.0.0.1",
      "port": 1234,
      "method": "method",
      "password": "password",
      "ota": false,
      "level": 0
    }
  ]
}
```

Ở đâu:

* `email`: Địa chỉ email. Được sử dụng để nhận dạng người dùng.
* `địa chỉ`: Địa chỉ của máy chủ Shadowsocks. Có thể là IPv4, IPv6 hoặc tên miền.
* `cổng`: Cổng của máy chủ Shadowsocks.
* `phương pháp`: Phương thức mã hóa. Không có giá trị mặc định. Các tùy chọn là: 
  * `"aes-256-cfb"`
  * `"aes-128-cfb"`
  * `"chacha20"`
  * `"chacha20-ietf"`
  * `"aes-256-gcm"`
  * `"aes-128-gcm"`
  * `"chacha20-poly1305"` hoặc `"chacha20-ietf-poly1305"`
* `mật khẩu`: Mật khẩu. Có thể là bất kỳ chuỗi nào.
* `ota`: Có hay không sử dụng OTA. 
  * Khi sử dụng AEAD, `ota` không có hiệu lực.
* `cấp độ`: Cấp độ người dùng.

> `servers`: \[[ServerObject](#serverobject)\]

Một mảng [ServerObject](#serverobject)s.

### ServerObject

```javascript
{
  "email": "love@v2ray.com",
  "address": "127.0.0.1",
  "port": 1234,
  "method": "加密方式",
  "password": "密码",
  "ota": false,
  "level": 0
}
```

> `email`: string

Địa chỉ email. Được sử dụng để nhận dạng người dùng.

> `address`: address

Cần thiết. Địa chỉ máy chủ Shadowsocks. Có thể là IPv4, IPv6 hoặc địa chỉ miền.

> `port`: number

Cần thiết. Cổng máy chủ Shadowsocks.

> `method`: string

Cần thiết. Xem [Phương thức mã hóa](#encryption-methods) để biết các giá trị có sẵn.

> `password`: string

Cần thiết. Mật khẩu trong giao thức Shadowsocks. Có thể là bất kỳ chuỗi nào.

> `ota`: true | false

Có hay không sử dụng OTA. Giá trị mặc định là `false`.

Khi sử dụng mã hóa AEAD, trường này không có hiệu lực.

> `level`: number

Cấp người dùng.

## Phương thức mã hóa

* `"aes-256-cfb"`
* `"aes-128-cfb"`
* `"chacha20"`
* `"chacha20-ietf"`
* `"aes-256-gcm"`
* `"aes-128-gcm"`
* `"chacha20-poly1305"` hoặc `"chacha20-ietf-poly1305"`