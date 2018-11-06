---
refcn: chapter_02/transport/tcp
refen: configuration/transport/tcp
---
# TCP Transport

## TcpObject

```javascript
{
  "header": {
    "type": "none"
  }
}
```

> `header`: NoneHeaderObject | HttpHeaderobject

Tiêu đề obfuscation. Giá trị mặc định là `NoneHeaderObject`.

### NoneHeaderObject

Không có tiêu đề obfuscation.

```javascript
{
  "type": "none"
}
```

> `type`: "none"

Vô hiệu hóa tiêu đề obfuscation.

### HttpHeaderObject

Tiêu đề HTTP obfuscation. Cấu hình phải giống nhau giữa kết nối trong và ngoài.

```javascript
{
  "type": "http",
  "request": {},
  "response": {}
}
```

> `type`: "http"

Bật tính năng obfuscation của tiêu đề HTTP.

> `request`: [HTTPRequestObject](#httprequestobject)

Mẫu yêu cầu HTTP.

> `response`: [HTTPResponseObject](#httpresponseobject)

Mẫu phản hồi HTTP.

### HTTPRequestObject

```javascript
{
  "version": "1.1",
  "method": "GET",
  "path": ["/"],
  "headers": {
    "Host": ["www.baidu.com", "www.bing.com"],
    "User-Agent": [
      "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36",
      "Mozilla/5.0 (iPhone; CPU iPhone OS 10_0_2 like Mac OS X) AppleWebKit/601.1 (KHTML, like Gecko) CriOS/53.0.2785.109 Mobile/14A456 Safari/601.1.46"
    ],
    "Accept-Encoding": ["gzip, deflate"],
    "Connection": ["keep-alive"],
    "Pragma": "no-cache"
  }
}
```

> `version`: string

Phiên bản HTTP. Giá trị mặc định là `"1.1"`.

> `method`: string

Phương thức HTTP. Giá trị mặc định là `"NHẬN"`。

> `path`: \[ string \]

Đường dẫn HTTP. Một mảng là chuỗi. Đường dẫn sẽ được chọn ngẫu nhiên cho mọi kết nối.

> `headers`: map{string, \[ string \] }

Tiêu đề HTTP. Chìa khóa của mỗi mục nhập là khóa của tiêu đề HTTP. Giá trị của mỗi mục là một danh sách các chuỗi. Giá trị tiêu đề HTTP thực tế sẽ được chọn ngẫu nhiên từ danh sách cho mỗi kết nối. Giá trị mặc định là các giá trị trong ví dụ trên.

Trong kết nối, tất cả các khóa trong bản đồ được chỉ định sẽ được đặt thành tiêu đề HTTP.

### HTTPResponseObject

```javascript
{
  "version": "1.1",
  "status": "200",
  "reason": "OK",
  "headers": {
    "Content-Type": ["application/octet-stream", "video/mpeg"],
    "Transfer-Encoding": ["chunked"],
    "Connection": ["keep-alive"],
    "Pragma": "no-cache"
  }
}
```

> `version`: string

Phiên bản HTTP. Giá trị mặc định là `"1.1"`.

> `status`: string

Trạng thái HTTP. Giá trị mặc định là `"200"`

> `reason`: string

Thông báo trạng thái HTTP. Giá trị mặc định là `"OK"`.

> `headers`: map{string, string}

Tiêu đề HTTP. Chìa khóa của mỗi mục nhập là khóa của tiêu đề HTTP. Giá trị của mỗi mục là một danh sách các chuỗi. Giá trị tiêu đề HTTP thực tế sẽ được chọn ngẫu nhiên từ danh sách cho mỗi kết nối. Giá trị mặc định là các giá trị trong ví dụ trên.

Trong kết nối, tất cả các khóa trong bản đồ được chỉ định sẽ được đặt thành tiêu đề HTTP.