* * *

refcn: chapter_02/protocols/dokodemo refen: configuration/protocols/dokodemo

* * *

# Dokodemo-door

* Tên: `dokodemo-cửa`
* Loại: Inbound

Cửa Dokodemo là giao thức cho các kết nối gửi đến. Nó lấy bất kỳ kết nối nào và chuyển chúng đến đích đã chỉ định.

Cửa Dokodemo cũng có thể (nếu được cấu hình) hoạt động như một proxy trong suốt.

## ConfigurationObject

```javascript
{
  "address": "8.8.8.8",
  "port": 53,
  "network": "tcp",
  "followRedirect": false,
  "userLevel": 0
}
```

> `address`: address

Địa chỉ của máy chủ đích. Có thể là IPv4, IPv6 hoặc tên miền, dưới dạng chuỗi. Khi `followRedirect` (xem bên dưới) là `true`, `address` có thể rỗng.

> `port`: number

Cổng của máy chủ đích.

> `network`: "tcp" | "udp" | "tcp,udp"

Loại mạng được chấp nhận. Nếu `"tcp"` được chỉ định, tất cả lưu lượng UDP được gửi tới cửa sổ dokodemo này sẽ bị hủy.

> `followRedirect`: true | false

Khi đặt thành `true`, dokodemo-door sẽ nhận ra đích từ TProxy và sử dụng nó làm đích đến của nó. Xem `TProxy` trong [phương tiện giao thông](../transport.md) để xem chi tiết.

> `userLevel`: number

Cấp người dùng. Tất cả các kết nối đều chia sẻ cấp độ này. Xem [Chính sách](../policy.md) để biết chi tiết.

## Ví dụ về proxy trong suốt

Thêm một cửa dokodemo vào trong như dưới đây.

```javascript
{
  "network": "tcp,udp",
  "timeout": 30,
  "followRedirect": true
}
```

Cấu hình iptables như dưới đây.

```bash
# Tạo chuỗi mới
iptables -t nat -N V2RAY
iptables -t mangle -N V2RAY
iptables -t mangle -N V2RAY_MARK

# Bỏ qua địa chỉ máy chủ V2Ray của bạn
# Nó rất QUAN TRỌNG, hãy cẩn thận.
iptables -t nat -A V2RAY -d 123.123.123.123 -j TRỞ LẠI

# Bỏ qua mạng LAN và bất kỳ địa chỉ nào khác mà bạn muốn bỏ qua proxy
# Xem Wikipedia và RFC5735 để có danh sách đầy đủ các mạng được bảo lưu.
iptables -t nat -A V2RAY -d 0.0.0.0/8 -j TRỞ LẠI
iptables -t nat -A V2RAY -d 10.0.0.0/8 -j TRỞ LẠI
iptables -t nat -A V2RAY-127.0.0.0/8 -j RETURN
iptables -t nat -A V2RAY-169.254.0.0/16 -j TRỞ LẠI
iptables -t nat -A V2RAY-172.16.0.0/12 -j TRỞ LẠI
iptables -t nat -A V2RAY-192.168 .0.0 / 16 -j RETURN
iptables -t nat -A V2RAY-224.0.0.0/4 -j TRẢ LẠI
iptables -t nat -A V2RAY-240.0.0.0/4 -j TRẢ LẠI

# Mọi thứ khác cần được chuyển hướng đến cổng địa phương của cửa Dokodemo
iptables -t nat -A V2RAY -p tcp -j ĐỔI MỚI - sang-cổng 12345

# Thêm bất kỳ quy tắc UDP nào
tuyến IP thêm địa chỉ mặc định dev lo table 100
ip rule add fwmark 1 tra cứu 100
iptables -t mangle -A V2RAY -p udp --dữ 53 -j TPROXY --on-port 12345 --tinxy-mark 0x01 / 0x01
iptables -t mangle -A V2RAY_MARK -p udp --dẫn 53 -j MARK --set-mark 1

# Áp dụng các quy tắc
iptables -t nat -Một OUTPUT -p tcp -j V2RAY
iptables -t mangle -A PREROUTING -j V2RAY
iptables -t mangle -A OUTPUT -j V2RAY_MARK
```