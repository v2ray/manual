---
refcn: chapter_02/protocols/mtproto
refen: configuration/protocols/mtproto
---
# MTProto

* Tên: `mtproto`
* Loại: Inbound / Outbound

Proxy MTProto là một procol đặc biệt cho Telegram. Nó bao gồm một cặp proxy gửi đến và outboud trong V2Ray. Chúng thường được sử dụng cùng nhau để xây dựng một proxy cho Telegram

Hiện tại V2Ray chỉ hỗ trợ địa chỉ IPv4 của máy chủ Telegram.

## InboundConfigurationObject

```javascript
{
  "users": [{
    "email": "love@v2ray.com",
    "level": 0,
    "secret": "b0cbcef5a486d9636472ac27f8e11a9d"
  }]
}
```

> `users`: \[[UserObject](#userobject)\]

Một mảng người dùng. Hiện tại chỉ người dùng đầu tiên mới có hiệu quả.

### UserObject

```javascript
{
  "email": "love@v2ray.com",
  "level": 0,
  "secret": "b0cbcef5a486d9636472ac27f8e11a9d"
}
```

> `email`: string

Email người dùng. Được sử dụng cho mục đích theo dõi. Xem [Thống kê](../stats.md).

> `level`: number

Cấp người dùng.

> `secret`: string

Bí mật của người dùng. Trong Telegram, sử dụng bí mật phải dài 32 ký tự, và chỉ chứa các ký tự giữa `0` để `9`, và `một`để `f`.

{% hint style='tip' %}

Bạn có thể sử dụng lệnh sau để tạo bí mật MTProto: `openssl rand -hex 16`

{% endhint %}

## Cấu hình đi {#outbound}

```javascript
{
}
```

## Mẫu vật {#sample}

MTProto chỉ có thể được sử dụng cho giao thông Telegram. Bạn có thể cần một quy tắc định tuyến để kết hợp tương ứng trong và ngoài. Đây là một mẫu không đầy đủ.

Trong nước:

```javascript
{
  "tag": "tg-in",
  "port": 443,
  "protocol": "mtproto",
  "settings": {
    "users": [{"secret": "b0cbcef5a486d9636472ac27f8e11a9d"}]
  }
}
```

Outbound:

```javascript
{
  "tag": "tg-out",
  "protocol": "mtproto",
  "settings": {}
}
```

Định tuyến:

```javascript
{
  "type": "field",
  "inboundTag": ["tg-in"],
  "outboundTag": "tg-out"
}
```

Định cấu hình ứng dụng Telegram của bạn để kết nối với cổng 443 trên máy này.