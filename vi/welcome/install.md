---
refcn: chapter_00/install
refen: welcome/install
---

# Tải xuống & Cài đặt

## Nền tảng {#platform}

V2Ray có sẵn trên các nền tảng sau:

* Windows 7 trở lên (x86 / amd64)
* Mac OS X 10.10 Yosemite trở lên (amd64)
* Linux phiên bản 2.6.23 trở lên (x86 / amd64 / arm / arm64 / mips64 / mips) 
  * Bao gồm nhưng không giới hạn ở Debian 7/8, Ubuntu 12.04 / 14.04 trở lên, CentOS 6/7, Arch Linux
* FreeBSD (x86 / amd64)
* OpenBSD (x86 / amd64)
* Dragonfly BSD (amd64)

## Tải về {#download}

Bạn có thể tìm thấy các gói dựng sẵn tại đây:

1. Phát hành Github: [github.com/v2ray/v2ray-core](https://github.com/v2ray/v2ray-core/releases)
2. Redistribution: [github.com/v2ray/dist](https://github.com/v2ray/dist)
3. Homebrew: [github.com/v2ray/homebrew-v2ray](https://github.com/v2ray/homebrew-v2ray)
4. Arch Linux: [gói / cộng đồng / x86_64 / v2ray /](https://www.archlinux.org/packages/community/x86_64/v2ray/)
5. Snapcraft: [snapcraft.io/v2ray-core](https://snapcraft.io/v2ray-core)

Tất cả các gói đều ở định dạng ZIP. Tải xuống và giải nén các gói tương ứng vào hệ thống của bạn.

## Kiểm chứng {#verify}

Có 2 cách để xác minh gói.

1. Mỗi tệp `.zip` có tệp `.dgst` tương ứng với các tệp SHA.
2. Tập tin chữ ký GPG cho các tập tin thực thi (v2ray / v2ray.exe) có thể được tìm thấy trong v2ray.sig (hoặc v2ray.exe.sig) trong cùng một gói. Khóa công khai là [trong kho lưu trữ](https://raw.githubusercontent.com/v2ray/v2ray-core/master/release/verify/official_release.asc).

## Cài đặt trên Windows hoặc Mac OS {#install-windows}

Chạy v2ray / v2ray.exe sau khi giải nén các gói.

## Cài đặt trên Linux {#install-linux}

Chúng tôi cung cấp một kịch bản để cài đặt trên Linux. Kịch bản này phát hiện v2ray đã cài đặt trước đó và sau đó nâng cấp hoặc cài đặt một phiên bản mới cho phù hợp. Nếu có phiên bản trước, tệp cấu hình trong / etc / v2ray sẽ không bị ghi đè trong khi nâng cấp.

Lệnh sau giả định quyền root.

Chạy lệnh sau để cài đặt V2Ray. Nếu yum hoặc apt có sẵn, tập lệnh sẽ cài đặt giải nén và daemon / systemd. Họ được yêu cầu chạy V2Ray như một dịch vụ. Bạn cần cài đặt chúng theo cách thủ công nếu hệ thống Linux của bạn không hỗ trợ yum hoặc apt.

```bash
curl -Ls https://install.direct/go.sh | sudo bash
```

Tập lệnh cài đặt các tệp sau.

* `/ usr / bin / v2ray / v2ray`: V2Ray thực thi
* `/ usr / bin / v2ray / v2ctl`: Tiện ích
* `/etc/v2ray/config.json`: Tập tin cấu hình
* `/usr/bin/v2ray/geoip.dat`: Tệp dữ liệu IP
* `/usr/bin/v2ray/geosite.dat`: tệp dữ liệu miền

Tập lệnh này cũng cấu hình V2Ray để chạy dưới dạng dịch vụ, nếu systemd có sẵn.

Cấu hình ở các vị trí sau.

* `/etc/systemd/system/v2ray.service`: Systemd
* `/etc/init.d/v2ray`: SysV

Sau khi cài đặt, chúng tôi sẽ cần:

1. Cập nhật tập tin `/etc/v2ray/config.json` cho kịch bản của riêng bạn.
2. Chạy lệnh `dịch vụ v2ray bắt đầu` để bắt đầu V2Ray.
3. Tùy chọn chạy `dịch vụ v2ray start | stop | status | reload | restart | force-reload` để điều khiển dịch vụ V2Ray.

### go.sh {#gosh}

go.sh hỗ trợ các tham số sau.

* `-p` hoặc `--proxy`: Sử dụng proxy để tải xuống gói V2Ray. Giống như định dạng curl, chẳng hạn như `"socks5: //127.0.0.1: 1080"` hoặc `"http://127.0.0.1:3128"`.
* `-f` hoặc `- force`: Bắt buộc cài đặt. Kịch bản sẽ giả định V2Ray chưa được cài đặt.
* `phiên bản`: Phiên bản sẽ được cài đặt, chẳng hạn như `"v1.13"`. Giá trị mặc định là bản phát hành ổn định mới nhất.
* `--local`: Sử dụng gói địa phương để cài đặt.

Ví dụ:

* Sử dụng SOCKS proxy 127.0.0.1:1080 để cài đặt gói mới nhất: ```./go.sh -p socks5://127.0.0.1:1080```
* Cài đặt v1.13 từ tệp cục bộ:```./go.sh --version v1.13 --local /path/to/v2ray.zip```

## Docker {#docker}

V2Ray cung cấp 2 hình ảnh docker:

* [v2ray / official](https://hub.docker.com/r/v2ray/official/): Chứa phiên bản chính thức.
* [v2ray / dev](https://hub.docker.com/r/v2ray/dev/): Chứa mã mới nhất.

2 hình ảnh có cấu trúc giống như cài đặt Linux.