---
refcn: chapter_00/faq
refen: welcome/faq
---
# Câu hỏi thường gặp (FAQ)

## Sử dụng V2Ray

### Cách nâng cấp V2Ray

* Tải xuống gói mới nhất hoặc
* Chạy lại tập lệnh cài đặt (chỉ dành cho Linux)

### Lỗi V2Ray

* Nếu bạn đang sử dụng Linux với systemd, bạn có thể xem nhật ký hoảng loạn bằng lệnh `journalctl -u v2ray`.
* Nói chung bạn có thể chạy lệnh `v2ray -config =<config-file> -test` để xem thông tin lỗi.

## Lỗi V2Ray

### Socks: Unknown Socks version: 67

Nguyên nhân có thể

* Bạn đang sử dụng vớ đi trong V2Ray, nhưng trình duyệt của bạn được định cấu hình để sử dụng proxy HTTP.

Dung dịch

* Thêm HTTP vào trong V2Ray và sau đó cập nhật cài đặt proxy trình duyệt của bạn để sử dụng proxy này.

## Giấy phép của dự án này

Project V sử dụng giấy phép sau.

### V2Ray

Mã nguồn và các bản phát hành chính thức được cấp phép theo giấy phép MIT, bao gồm mã nguồn và các bản phát hành trong kho lưu trữ sau.

* [lõi v2ray / v2ray](https://www.github.com/v2ray/v2ray-core/)
* [v2ray / ext](https://www.github.com/v2ray/ext)

### V2Ray.Com

Trang web chính thức, [v2ray.com](https://www.v2ray.com/), được cấp phép theo [Giấy phép Creative Commons Ghi công 4.0 Quốc tế](https://creativecommons.org/licenses/by/4.0/).

* Bao gồm tất cả văn bản và hình ảnh hiển thị trên trang web.
* Bao gồm <a href="https://www.v2ray.com/resources/v2ray_1024.png" target="_blank">biểu tượng Project V</a>.
* Bao gồm tất cả mã nguồn được sử dụng để tạo trang web, ví dụ [v2ray / manual](https://www.github.com/v2ray/manual).

### Ảnh chụp màn hình và các tệp khác {#screenshots}

Tất cả các tệp của bên thứ ba được liệt kê bên dưới đều thuộc về người tạo của họ. Bất kỳ ai tạo tệp đều sở hữu tệp.

* Bao gồm tất cả ảnh chụp màn hình của Project V.
* Bao gồm tất cả các tệp cấu hình được sử dụng để chạy Project V.
* Bao gồm tất cả các bản ghi được tạo bởi Project V trong thời gian chạy.

### Nội dung khác {#other}

Tất cả nội dung không được đề cập ở trên sẽ được cấp phép theo từng trường hợp.