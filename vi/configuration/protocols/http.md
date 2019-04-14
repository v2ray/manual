---
refcn: chapter_02/protocols/http
refen: configuration/protocols/http
---
# HTTP

* Tên: `http`
* Loại: Inbound

HTTP là giao thức cho các kết nối gửi đến. Nó tương thích với HTTP / 1.1.

## InboundConfigurationObject

```javascript
{
  "accounts": [
    {
      "user": "my-username",
      "pass": "my-password"
    }
  ],
  "allowTransparent": false,
  "userLevel": 0
}
```

> `accounts`: \[[AccountObject](#accountobject)\]

Một mảng trong đó mỗi mục là một tài khoản. Nó được để trống theo mặc định. Nếu không trống, Xác thực HTTP cơ bản là bắt buộc đối với các yêu cầu gửi đến.

> `allowTransparent`: true | false

Nếu được đặt thành `true`, tất cả yêu cầu HTTP được gửi đến thư đến này sẽ được proxy, bao gồm cả yêu cầu không phải proxy.

> `userLevel`: number

Cấp người dùng. Tất cả các kết nối đều chia sẻ cấp độ này.

### AccountObject

```javascript
{
  "user": "my-username",
  "pass": "my-password"
}
```

> `user`: string

Tên người dùng để xác thực HTTP.

> `pass`: string

mật khẩu để xác thực HTTP.

{% hint style='info' %}

Sử dụng các cài đặt sau trong Linux để sử dụng proxy HTTP trong phiên hiện tại.

* `xuất khẩu http_proxy = http: //127.0.0.1: 8080/` (URL có thể thay đổi theo cấu hình của bạn)
* `xuất https_proxy =$http_proxy`

{% endhint %}