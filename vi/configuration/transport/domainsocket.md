---
refcn: chapter_02/transport/domainsocket
refen: configuration/transport/domainsocket
---
# Domain Socket Transport

Domain Socket sử dụng ổ cắm miền Unix chuẩn để truyền tải dữ liệu. Ổ cắm tên miền là kênh chuyển tiếp giữa các hệ thống. Nó không gây nhiễu bộ đệm mạng và có thể nhanh hơn một chút so với trasnferring thông qua mạng loopback cục bộ.

Ổ cắm miền chỉ có thể được sử dụng trên các nền tảng hỗ trợ ổ cắm miền Unix, chẳng hạn như macOS và Linux. Nó không có sẵn trên Windows.

{% hint style='info' %}

Khi ổ cắm miền được sử dụng, IP và cổng được chỉ định trên proxy đến / đi sẽ bị bỏ qua. Tất cả lưu lượng truy cập đều được tunnel qua socket miền.

{% endhint %}

## DomainSocketObject

`DomainSocketObject` được sử dụng trong `dsSettings` trường trong `TransportObject` và `StreamSettingsObject`.

```javascript
{
  "path": "/path/to/ds/file"
}
```

> `path`: string

Đường dẫn tệp tuyệt đối hợp lệ. Trước khi chạy V2Ray, tệp trên đường dẫn này không được tồn tại.