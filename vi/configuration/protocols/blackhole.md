---
refcn: chapter_02/protocols/blackhole
refen: configuration/protocols/blackhole
---
# Blackhole

* Tên: `blackhole`
* Loại: Đi

Blackhole là một giao thức cho các kết nối gửi đi. Nó chặn tất cả các kết nối với các câu trả lời được xác định trước. Kết hợp với [Định tuyến](../routing.md), điều này có thể được sử dụng để chặn truy cập vào một số trang web.

## ConfigurationObject

```javascript
{
  "response": {
    "type": "none"
  }
}
```

> `response`: [ResponseObject](#responseobject)

Phản hồi được xác định trước. Blockhole sẽ gửi (nếu có) dữ liệu được xác định trước ngay lập tức cho bất kỳ kết nối nào được truyền tới nó và đóng kết nối.

### ResponseObject

```javascript
{
  "type": "none"
}
```

> `type`: "none" | "http"

Loại phản hồi, các tùy chọn có sẵn là:

* `"none"`: Giá trị mặc định. Phản hồi trống.
* `"http"`: Đáp ứng HTTP 403 hợp lệ.