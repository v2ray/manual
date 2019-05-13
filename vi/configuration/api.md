---
refcn: chapter_02/api
refen: configuration/api
---

# API

V2Ray cung cấp một số API để truy cập từ xa. Các API này dựa trên [gRPC](https://grpc.io/).

Khi API được bật, V2Ray sẽ tự động tạo proxy đi, được gắn thẻ là `thẻ`. Người dùng phải [định tuyến](routing.md) tất cả các kết nối gRPC cho kết nối này.

## ApiObject

`ApiObject` được sử dụng làm trường `api` trong cấu hình cấp cao nhất.

```javascript
{
  "tag": "api",
  "services": [
    "HandlerService",
    "LoggerService",
    "StatsService"
  ]
}
```

> `tag`: string

Thẻ của proxy gửi đi.

> `services`: \[ string \]

Danh sách các API được bật.

## Danh sách API được hỗ trợ

### HandlerService

API để thao tác proxy trong và ngoài. Các chức năng sau đây được cung cấp:

* Thêm proxy vào / ra mới.
* Xóa proxy hiện tại / thư đi.
* Thêm người dùng mới vào proxy đến (chỉ dành cho VMess).
* Xóa người dùng hiện tại khỏi proxy gửi đến (chỉ VMess).

### LoggerService

Để khởi động lại trình ghi nhật ký nội bộ. Có thể làm việc với logrotate cho các tệp log hoạt động.

### StatsService

Hỗ trợ nội bộ [Thống kê](stats.md).