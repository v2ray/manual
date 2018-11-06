---
refcn: chapter_00/command
refen: welcome/command
---
# Dòng lệnh

## V2Ray

V2Ray có các tham số dòng lệnh sau:

```shell
v2ray [-version] [-test] [-config=config.json] [-format=json]
```

> `-phiên bản`

Chỉ in phiên bản V2Ray và sau đó thoát.

> `-kiểm tra`

Kiểm tra cấu hình, xuất ra bất kỳ lỗi nào và sau đó thoát ra.

> `-config`

URI của cấu hình. Định dạng Avilable là:

* Đường dẫn đến tệp cấu hình cục bộ. Có thể là đường dẫn tương đối hoặc đường dẫn tuyệt đối.
* `"stdin:"`: Cho biết V2Ray để đọc cấu hình từ đầu vào tiêu chuẩn. Người gọi phải đóng stdin sau khi viết cấu hình.
* Giá trị bắt đầu bằng `http: //` hoặc `https: //` (chữ thường): V2Ray cố tải cấu hình từ địa chỉ từ xa.

> `-định dạng`

Định dạng cấu hình. Lựa chọn là:

* `json`: Định dạng JSON.
* `pb` hoặc `protobuf`: Định dạng Protobuf.

{% hint style='info' %}

Khi `-config` không được chỉ định, V2Ray đầu tiên cố gắng tải cấu hình từ `config.json` trong thư mục làm việc, sau đó từ thư mục được chỉ định bởi [biến môi trường](../configuration/env.md) `v2ray.location.asset`.

{% endhint %}

## V2Ctl

V2Ctl có các tham số dòng lệnh sau:

```shell
v2ctl <command> <options>
```

Các lệnh khả dụng được liệt kê dưới đây. Mỗi lệnh có các tùy chọn riêng.

### Kiểm chứng

`v2ctl xác minh [--sig = / path / to / sigfile] / tệp / tới / xác minh`

Để xác minh chữ ký của một nhị phân V2Ray.

Tùy chọn:

> `sig`

Đường dẫn đến tệp chữ ký. Giá trị mặc định là tệp ".sig" đến đường dẫn cần được xác minh.

> Đối số đầu tiên: tệp cần được xác minh.

### Cấu hình

`Cấu hình v2ctl`

Không có lựa chọn. Lệnh này đọc cấu hình ở định dạng JSON từ stdin, và sau đó viết cấu hình tương ứng trong định dạng Protobuf để stdout.

### UUID

`v2ctl uuid`

Không có lựa chọn. Lệnh này in một UUID ngẫu nhiên.