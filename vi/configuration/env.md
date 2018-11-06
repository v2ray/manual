---
refcn: chapter_02/env
refen: configuration/env
---
# Biến môi trường

V2Ray đọc các biến môi trường sau đây.

## Kích thước bộ nhớ cache cho mỗi kết nối {#buffer-size}

* Tên: `v2ray.ray.buffer.size` hoặc `V2RAY_RAY_BUFFER_SIZE`
* Đơn vị: MBytes
* Giá trị mặc định: 2 trên x86, amd64, arm64 và s390x. Bộ nhớ cache này bị tắt trên các nền tảng khác.
* Giá trị đặc biệt: 0 cho kích thước bộ nhớ cache không giới hạn

Đối với mỗi kết nối, khi có sự khác biệt về tốc độ giữa lưu lượng vào và ra, V2Ray sẽ lưu một số dữ liệu để có thông lượng lớn hơn. Cài đặt này kiểm soát kích thước của bộ nhớ cache. Bộ nhớ cache càng lớn thì hiệu suất càng tốt.

## Vị trí của tài sản V2Ray {#asset}

* Tên: `v2ray.location.asset` hoặc `V2RAY_LOCATION_ASSET`
* Giá trị mặc định: Cùng thư mục nơi v2ray là.

Biến này chỉ định thư mục chứa tệp geoip.dat và geosite.dat.

## Vị trí của cấu hình V2Ray {#config}

* Tên: `v2ray.location.config` hoặc `V2RAY_LOCATION_CONFIG`
* Giá trị mặc định: Cùng thư mục nơi v2ray là.

Biến này chỉ định một thư mục có config.json.

## Đọc phân tán {#scatter-io}

* Tên: `v2ray.buf.readv` hoặc `V2RAY_BUF_READV`
* Giá trị mặc định: `auto`

V2Ray 3.37 sử dụng Scatter / Gather IO. Tính năng này sẽ sử dụng ít bộ nhớ hơn khi tốc độ kết nối vượt quá 100 MByte / giây. Các giá trị có thể là: `auto`, `enable` và `disable`.

* `bật`: Bật đọc phân tán.
* `tắt`: Tắt đọc phân tán.
* `auto`: Chỉ kích hoạt trên Windows, MacOS, Linux khi CPU là x86, AMD64 hoặc s390x.

Khi tốc độ kết nối nhỏ hơn 100 MByte / s, cho dù điều này có được bật hay không, không có sự khác biệt rõ ràng về mức sử dụng bộ nhớ.