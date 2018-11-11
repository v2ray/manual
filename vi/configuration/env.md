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

**Deprecated. Use bufferSize in Policy.**

For each connection, when there is a difference in speed between inbound and outbound traffic, V2Ray will cache some data for larger throughput. This setting controls the size of the cache. The larger the cache, the better the performance.

## Vị trí của tài sản V2Ray {#asset}

* Tên: `v2ray.location.asset` hoặc `V2RAY_LOCATION_ASSET`
* Giá trị mặc định: Cùng thư mục nơi v2ray là.

This variable specifies a directory where geoip.dat and geosite.dat files are.

## Vị trí của cấu hình V2Ray {#config}

* Tên: `v2ray.location.config` hoặc `V2RAY_LOCATION_CONFIG`
* Giá trị mặc định: Cùng thư mục nơi v2ray là.

This variable specifies a directory where config.json is.

## Đọc phân tán {#scatter-io}

* Tên: `v2ray.buf.readv` hoặc `V2RAY_BUF_READV`
* Giá trị mặc định: `auto`

V2Ray 3.37 uses Scatter/Gather IO. This feature will use less memory when connection speed is over 100 MByte/s. Possible values are: `auto`, `enable` and `disable`.

* `bật`: Bật đọc phân tán.
* `tắt`: Tắt đọc phân tán.
* `auto`: Chỉ kích hoạt trên Windows, MacOS, Linux khi CPU là x86, AMD64 hoặc s390x.

When connection speed is less than 100 MByte/s, no matter whether this is enabled or not, there is no obvious difference in terms of memory usage.