---
refcn: chapter_02/stats
refen: configuration/stats
---

# Số liệu thống kê

V2Ray cung cấp một số thông tin về nội bộ của nó.

## StatsObject

`StatsObject` được sử dụng như `số liệu thống kê` trường trong cấu hình cấp cao nhất.

```javascript
{
}
```

Tại thời điểm này không có tham số trong cài đặt thống kê. Số liệu thống kê được bật tự động khi `StatsObject` được đặt ở cấu hình cấp cao nhất. Bạn cũng cần bật cài đặt tương ứng trong [Chính sách](policy.md), để theo dõi số liệu thống kê người dùng hoặc hệ thống.

Tất cả các số liệu thống kê quầy được liệt kê dưới đây:

## Lưu lượng người dùng

Nếu người dùng không có địa chỉ email được đặt trong cài đặt giao thức, thống kê lưu lượng truy cập sẽ không được bật.

> `người dùng>>>[email]>>>giao thông>>>uplink`

Lưu lượng truy cập uplink tích lũy của người dùng cụ thể, tính theo byte.

> `người dùng>>>[email]>>>lưu lượng truy cập>>>đường xuống`

Lưu lượng truy cập đường xuống tích lũy của người dùng cụ thể, tính theo byte.

## Lưu lượng truy cập toàn cầu

> `trong nước>>>[tag]>>>giao thông>>>uplink`

Lưu lượng truy cập uplink tích lũy cụ thể trong nước, tính theo byte.

> `gửi đến>>>[tag]>>>lưu lượng truy cập>>>đường xuống`

Lưu lượng truy cập đường xuống được tích lũy của cụ thể trong nước, tính theo byte.