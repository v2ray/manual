---
refcn: chapter_02/index
refen: configuration/index
---
# Cấu hình

V2Ray sử dụng [cấu hình dựa trên protobuf](https://developers.google.com/protocol-buffers/). Vì định dạng protobuf ít có thể đọc được, V2Ray cũng hỗ trợ cấu hình trong JSON. Trước khi V2Ray chạy, nó sẽ tự động chuyển đổi cấu hình JSON thành protobuf. Điều đó đang được nói, các định dạng cấu hình khác có thể được giới thiệu trong furture.

Ở đây chúng tôi giới thiệu cấu hình dựa trên JSON.

JSON, hoặc [Ký hiệu đối tượng JavaScript](https://en.wikipedia.org/wiki/JSON), viết tắt là các đối tượng trong Javascript. Một tệp JSON chứa một và chỉ một đối tượng JSON, bắt đầu bằng "{" và kết thúc bằng "}".

Một đối tượng JSON chứa một danh sách các cặp giá trị khóa. Khóa là một chuỗi và giá trị có thể khác nhau về các loại, chẳng hạn như chuỗi, số, boolean, mảng hoặc đối tượng khác. Một đối tượng điển hình như sau:

```javascript
{
  "stringValue": "This is a string.",
  "numberValue": 42,
  "boolValue": true,
  "arrayValue": ["this", "is", "a", "string", "array"],
  "objectValue": {
    "another": "object"
  }
}
```

{% hint style='info' %}

V2Ray hỗ trợ các chú thích trong JSON ， được chú thích bởi "//" hoặc "/ \ * \ * /". Trong trình chỉnh sửa không hỗ trợ nhận xét, chúng có thể được hiển thị dưới dạng lỗi, nhưng nhận xét thực sự hoạt động tốt trong V2Ray.

{% endhint %}

## Các kiểu dữ liệu JSON

Đây là một giới thiệu ngắn gọn về các kiểu dữ liệu JSON. Chúng sẽ được tham chiếu trong phần còn lại của tài liệu.

> `boolean`: true | false

Giá trị logic, phải là `true` hoặc `false`, không có dấu ngoặc kép.

> `con số`

Thông thường các số nguyên không âm, không có dấu ngoặc kép.

> `chuỗi`

Chuỗi ký tự, được bao quanh bởi dấu ngoặc kép.

> `array`: []

Mảng các yếu tố. Loại phần tử của nó thường giống nhau, ví dụ, `[string]` là một mảng gồm `chuỗi`s.

> `object`: {}

Vật. Nó đi kèm với một danh sách các cặp giá trị quan trọng.

{% hint style='tip' %}

Cặp giá trị khóa thường kết thúc bằng dấu phẩy ",", nhưng không được kết thúc bằng dấu phẩy nếu đó là phần tử cuối cùng của đối tượng.

{% endhint %}

## Các kiểu dữ liệu chung V2Ray

> `map`: object \{string, string\}

Một đối tượng có khóa và giá trị có các loại cố định.

> `address`: string

Địa chỉ IP hoặc tên miền ở dạng chuỗi, chẳng hạn như `"8.8.8.8"` hoặc `"www.v2ray.com"`

> `address_port`: string

Một `địa chỉ` với cổng, chẳng hạn như `"8.8.8.8:53"` hoặc `"www.v2ray.com:80"`. Trong một số tập quán, phần địa chỉ có thể được bỏ qua, như `": 443"`.