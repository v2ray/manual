---
refcn: chapter_02/protocols/freedom
refen: configuration/protocols/freedom
---
# Freedom

* Tên: `tự do`
* Loại: Đi

Tự do là một giao thức cho các kết nối gửi đi. Nó chuyển tất cả kết nối TCP hoặc UDP đến đích của họ. Điều này gửi đi được sử dụng khi bạn muốn gửi lưu lượng truy cập đến đích thực của nó.

## ConfigurationObject

```javascript
{
  "domainStrategy": "AsIs",
  "redirect": "127.0.0.1:3366",
  "userLevel": 0
}
```

> `domainStrategy`: "AsIs" | "UseIP"

Chiến lược phân giải tên miền. Các tùy chọn là:

* `"AsIs"`: Giá trị mặc định. Giải quyết tên miền theo hệ thống.
* `"UseIP"`: Sử dụng [DNS nội bộ](../dns.md) cho độ phân giải tên miền.
* `"UseIPv4"`: Use IPv4 address only, after resolved by internal DNS.
* `"UseIPv6"`: Use IPv6 address only, after resolved by internal DNS.

(V2Ray 4.6+) In `UseIP` mode, when `sendThrough` is specified in [OutboundObject](../overview.md#outboundobject), Freedom will automatically choose between IPv4 and IPv6 address for destination based on `sendThrough` settings.

(V2Ray 4.7+) If `sendThrough` address conflicts with `"UseIPv4"` or `"UseIPv6"`, Freedom will fail to dial out-going connections.

> `redirect`: address_port

Redirect all connections to this address, in form like `"127.0.0.1:80"` or `":1234"`.

* Khi địa chỉ trống, ví dụ: `": 443"`, Tự do sẽ sử dụng địa chỉ đích ban đầu.
* Khi cổng là `0`, ví dụ `"v2ray.com:0"`, Tự do sẽ sử dụng cổng gốc.

> `userLevel`: number

User level. All connections share this level.