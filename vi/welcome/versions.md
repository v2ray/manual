---
refcn: chapter_00/01_versions
refen: welcome/versions
---
# Lịch sử phiên bản

## 2018.11.05 v4.1

* Thay đổi định dạng cấu hình JSON. Định dạng cũ vẫn được hỗ trợ.
* Hiệu suất trên khớp GeoIP được cải thiện.

## 2018.11.02 v4.0

* Proxy ngược.
* Phát hành các gói cho ppc64 và ppc64le.

## 2018.10.12 v3.47

* Di chuyển sang một đường ống phân phối liên tục mới

## 2018.09.28 v3.44

* Dokodemo-cửa bây giờ hỗ trợ TProxy trong Linux.

## 2018.09.21 v3.43

* DNS hiện hỗ trợ các truy vấn theo yêu cầu theo tên miền.

## 2018.09.14 v3.40

* Các tùy chọn ổ cắm mới trong cấu hình truyền tải. Nó có thể được sử dụng để thiết lập VPN.
* Tùy chọn TCP Fast Open mới trong cấu hình truyền tải.

## 2018.09.03 v3.38

* mKCP có tiêu đề WireGuard mới.
* Sửa các tệp nhị phân softfloat trong mips / mips64.

## 2018.08.31 v3.37

* Hiệu suất của kết nối mạng đọc trong optilized. Xem [Biến môi trường](../configuration/env.md)。
* VMess sử dụng AES-128-GCM theo mặc định trên ARM64.
* Được xây dựng bởi Go 1.11.

## 2018.08.24 v3.36

* Cải thiện hiệu suất tuyệt vời trên kết hợp tên miền phụ (`tên miền:`) trong định tuyến.
* Tính năng đối sánh tên miền đầy đủ hiện được hỗ trợ trong định tuyến.

## 2018.08.07 v3.34

* Quản lý bộ nhớ tốt hơn trên hầu hết các thiết bị.

## 2018.07.27 v3.32

* Lưu lượng truy cập BitTorrent bây giờ có thể được sniff'ed.
* New `giao thức` tùy chọn trong quy tắc định tuyến dựa trên giao thức định tuyến.
* New `geosite: speedtest` tùy chọn trong các quy tắc định tuyến để phù hợp với tất cả các máy chủ công cộng của speedtest.net.

## 2018.07.20 v3.31

* New [Domain Socket transport](../configuration/transport/domainsocket.md) (Cảm ơn @xiaokangwang).

## 2018.07.13 v3.30

* Khắc phục sự cố có thể gây ra các kết nối bị hỏng trong mKCP.
* Nhờ có [bạn của chúng tôi](https://crowdin.com/project/v2ray) người nói tiếng Nga. Bây giờ tài liệu của chúng tôi bằng [tiếng Nga](https://www.v2ray.com/ru/).

## 2018.07.06 v3.29

* Mới vào và ra cho proxy MTProto.

## 2018.06.29 v3.27

* DNS hiện hỗ trợ mạng con khách EDNS.
* Máy chủ lưu trữ tĩnh DNS hiện hỗ trợ đối sánh tên miền phụ.

## 2018.06.15 v3.26

* Thêm bản phát hành BSD Dragonfly.

## 2018.06.01 v3.24

* Kích thước bộ đệm trong (mỗi kết nối) bây giờ có thể được cấu hình trong cấu hình JSON.
* mKCP hiện hỗ trợ tiêu đề DTLS 1.2.
* Giao thông TLS hiện chỉ hỗ trợ các bộ mã hóa trong thông số kỹ thuật TLS 1.3.

## 2018.05.25 v3.23

* Trong cấu hình JSON, cổng có thể được chỉ định từ các biến env.
* Cấu hình JSON hiện hỗ trợ tải miền và IP từ các tệp được chỉ định.

## 2018.04.20 v3.19

* Thống kê lưu lượng truy cập cho proxy đến.

## 2018.04.13 v3.17

* V2Ray có thể tải tập tin cấu hình từ HTTP (s).
* TLS trong V2Ray có thể cấp chứng chỉ mới bằng chứng chỉ CA được cung cấp cho các miền trong yêu cầu gửi đến.
* [HTTP / 2](../configuration/transport/h2.md).

## 2018.04.06 v3.16

* [Thống kê](../configuration/stats.md).
* Shadowsocks inbound bây giờ có thể được cấu hình để chỉ nghe trên UDP. Rất khuyên bạn không nên nghe trên cả TCP và UDP trên cùng một cổng.

## 2018.03.02 v3.11

* Một cài đặt mới được giới thiệu trong VMess gửi đến, để cấm khách hàng sử dụng các phương thức mã hóa không an toàn.
* Cung cấp bản phát hành ARMv7.
* Cung cấp bản phát hành MIPS không yêu cầu FPU.

## 2018.02.23 v3.10

* Các mục nhật ký hiện có chứa ID phiên để phân biệt các phiên proxy.
* Sửa lỗi.

## 2018.02.15 v3.9

* Chúc mừng năm mới!
* Sửa lỗi.

## 2018.02.09 v3.7

* Xem trước nhà phát triển: [Remote API](../configuration/api.md)。
* Sửa lỗi.

## 2017.12.29 v3.5

* Geoip hiện hỗ trợ địa chỉ mạng riêng dưới tên "riêng tư".

## 2017.12.22 v3.4

* Websocket nows sử dụng giá trị của X-Forwarded-For header làm địa chỉ nguồn.
* Hỗ trợ kiến ​​trúc CPU s390x.

## 2017.12.08 v3.1

* Chính sách hỗ trợ.
* Vị trí tệp cấu hình có thể được chỉ định thông qua biến môi trường.

## 2017.12.01 v3.0

* Hỗ trợ Shadowsocks AEAD

## 2017.11.18 v2.50

* `v2ray` bây giờ đã cố gắng sử dụng `v2ctl` để phân tích cú pháp cấu hình. Hãy đảm bảo 2 tệp này nằm trong cùng một thư mục.
* Mới `IPOnDemand` chiến lược trong định tuyến.

## 2017.11.10 v2.47

* `dữ liệu địa lý` giờ đây nằm trong tệp `geosite.dat`.
* Sửa lỗi.

## 2017.11.03 v2.46

* Router bây giờ hỗ trợ `geosite: cn`, tương đương với `chinasites hiện có`, nhưng linh hoạt hơn.
* Bộ định tuyến hiện hỗ trợ `geoip`. 
  * Tệp `geoip.dat` được thêm vào các gói phát hành. Tệp này chứa tất cả thông tin `geoip` và phải nằm trong cùng thư mục của chương trình `v2ray`. Do cập nhật chậm trễ của tập lệnh cài đặt, bạn có thể phải sao chép tệp theo cách thủ công.
* Chương trình `v2ctl` được thêm vào các gói phát hành. Bạn có thể chạy `v2ctl verify / path / to / v2ray` để xác minh chữ ký của chương trình `v2ray`.

## 2017.10.27 v2.44

* HTTP hiện hỗ trợ Xác thực cơ bản.
* Một số lỗi đã được sửa.

## 2017.10.06 v2.40

* Khắc phục sự cố gây rò rỉ bộ nhớ.

## 2017.09.29 v2.39

* Proxy gửi đến bây giờ đóng các kết nối nhanh hơn khi máy chủ từ xa đóng chúng lại.
* Thời gian chờ kết nối mặc định thay đổi thành 5 phút.

## 2017.05.12 v2.27

* Chế độ miền mới trong bộ định tuyến.

## 2017.05.05 v2.26

* Sửa lỗi ổn định.

## 2017.04.28 v2.25

* Đơn giản đánh hơi trên lưu lượng truy cập HTTP và TLS cho miền thực tế theo yêu cầu.

## 2017.04.21 v2.24

* Ổn định Mux.
* Cải thiện hiệu quả bộ nhớ.

## 2017.04.15 v2.23

* Cải thiện hiệu suất trong Mux.
* Số lượng kết nối tối đa có thể được cấu hình trong Mux ngay bây giờ.
* Cải thiện hiệu suất trong HTTP gửi đến.
* connectionReuse được loại bỏ để ủng hộ Mux.

## 2017.04.08 v2.22

* Giao thức Mux.Cool.

## 2017.02.25 v2.20

* Chữ ký GPG được thêm vào gói tải xuống.
* Wv2ray.exe nhị phân mới được thêm vào gói Windows, chạy dưới dạng ứng dụng nền.

## 2017.02.18 v2.19

* Một cơ chế mới cho cuộc tấn công chống trả lời hiện được thực thi ở phía máy chủ. 
  * Không ảnh hưởng đến khách hàng hiện tại.
* Nâng cấp VMess AES-128-GCM / Chacha20-Poly1305 / Không có phương thức mã hóa nào. 
  * Vui lòng nâng cấp máy khách và máy chủ cùng một lúc.
  * AES-128-CFB không bị ảnh hưởng.
* Được xây dựng với Golang 1.8. Thêm hỗ trợ MIPS 32 bit.

## 2017.02.11 v2.18

* Mã WebSocket dọn dẹp.
* Xóa tùy chọn allowPassive. Bây giờ các kết nối thụ động luôn được cho phép.
* Sửa lỗi

## 2017.02.04 v2.17

* Sửa lỗi.

## 2017.01.28 v2.16

* Tùy chọn 'chuyển hướng' mới trong tự do. Nó có thể được sử dụng để thích ứng với các công cụ như Shadowsocks Obfs.
* Cải thiện hiệu suất trong chế độ không mã hóa VMess. Không tương thích với các phiên bản trước.
* Chúc mừng năm mới!

## 2017.01.16 v2.15

* Tất cả các proxy có thể sử dụng mKCP và WebSocket ngay bây giờ.

## 2017.01.09 v2.14

* Vớ 5 đi.
* Sửa lỗi.

## 2017.01.02 v2.13

* Sửa lỗi.

## 2016.12.26 v2.12

* Sửa lỗi.

## 2016.12.19 v2.11

* Tệp cấu hình JSON hiện hỗ trợ nhận xét.

## 2016.12.12 v2.10

* VMess hiện hỗ trợ các phương thức mã hóa AES-GCM và ChaCha20-Poly1305.

## 2016.12.05 v2.9

* Khắc phục sự cố tương thích với Alpine Linux.

## 2016.11.28 v2.8

* Shadowsocks server bây giờ chấp nhận các thiết lập OTA.
* Sửa lỗi.

## 2016.11.21 v2.7

* Trình xử lý kết nối vào và ra chính có thể được gắn thẻ ngay bây giờ.
* Sửa lỗi.

## 2016.11.14 v2.6

* Dữ liệu được gửi bởi một lần gửi có thể được ủy nhiệm cho một lần gửi đi khác.
* Định tuyến có thể dựa trên thẻ trong nước.

## 2016.11.07 v2.5

* Shadowsocks mới ra nước ngoài;
* Tiêu đề TCP mới: HTTP;

## 2016.10.24 v2.4

* TCP / mKCP / WebSocket có thể được cấu hình cho mỗi inbound / outbound;
* Định tuyến có thể được thực hiện trên nguồn IP;

## 2016.10.17 v2.3

* Giới thiệu cấu hình dựa trên Protobuf mới;
* OpenBSD nhị phân;
* Sửa nhỏ;

## 2016.09.19 v2.2

* Giao thông mới: WebSocket (Cám ơn [@xiaokangwang](https://github.com/xiaokangwang));

## 2016.09.19 v2.1

* Cải thiện hiệu suất mKCP;

## 2016.08.20 v2.0

* Một năm;

## 2016.08.15 v1.24

* Tiêu đề mKCP mới: utp;
* Tùy chọn mới trong cấu hình kết nối gửi đến "allowPassive" để cho phép kết nối thụ động;

## 2016.08.08 v1.23

* Tối ưu hóa định dạng gói tin mKCP. Phiên bản mKCP này KHÔNG tương thích với phiên bản trước đó;
* mKCP bây giờ có thể được cấu hình để ngụy trang như dữ liệu video.

## 2016.08.01 v1.22

* Sửa lỗi rò rỉ bộ nhớ trong mKCP;
* Thêm bản phát hành FreeBSD;

## 2016.07.25 v1.21

* Hiệu suất cao Chacha20 (Cảm ơn aead @);
* Sửa lỗi;

## 2016.07.18 v1.20

* Các tùy chọn KCP mới: readBufferSize và writeBufferSize;
* Sửa lỗi;

## 2016.07.11 v1.19

* Bật tùy chọn TLS cho tất cả các proxy;
* Khắc phục sự cố hiệu suất trong KCP;
* Khắc phục sự cố trong KCP có thể gây ra phản hồi EOF;

## 2016.07.04 v1.18

* Khắc phục sự cố "quá nhiều tệp mở" trong KCP;
* KCP hiện sử dụng ít CPU hơn;
* Sửa lỗi khác;

## 2016.06.19 v1.17

* KCP hiện được tích hợp vào V2Ray. (Đặc biệt cảm ơn [xiaokangwang](https://github.com/xiaokangwang), [xtaci](https://github.com/xtaci) và [skywind3000](https://github.com/skywind3000))
* Sửa lỗi nhỏ

## 2016.06.12 v1.16

* Tái sử dụng kết nối TCP hiện được bật theo mặc định;
* Dokodemo-door có thể nhận ra kết nối TCP được chuyển hướng bởi iptables;
* Blackhole có thể gửi lại dữ liệu bị cấm HTTP;

## 2016.06.05 v1.15

* Tùy chọn sử dụng lại kết nối TCP để có hiệu suất tốt hơn;
* Cho phép nghe trên một địa chỉ IP cụ thể;
* Cho phép gửi dữ liệu qua một địa chỉ IP cụ thể;
* Khắc phục sự cố trong proxy HTTP có thể làm cạn kiệt bộ nhớ;

## 2016.05.29 v1.14

* Khắc phục sự cố khẩn cấp trong proxy http;
* Các chức năng khác trong kịch bản cài đặt;
* Tuyến tĩnh trong DNS;
* Thay đổi địa chỉ máy chủ chính thức;

## 2016.05.16 v1.13

* Máy chủ DNS nội bộ, để cung cấp kết quả định tuyến tốt hơn kết hợp với chinasites và chinaip;
* Khắc phục sự cố trong chuyển tiếp UDP;

## 2016.05.01 v1.12.1

* Sửa lỗi trong VMess.

## 2016.05.01 v1.12

* Thứ hai cố gắng khắc phục vấn đề sử dụng bộ nhớ;
* Cải thiện hiệu suất Shadowsocks;
* Lựa chọn mới "không" trong loglevel;

## 2016.04.18 v1.11

* Cố gắng khắc phục sự cố sử dụng bộ nhớ.

## 2016.03.07 v1.10

* Khắc phục sự cố hiệu suất khi cổng động làm mới.

## 2016.02.29 v1.9.1

* Khắc phục sự cố xác thực một lần (OTA) Shadowsocks.

## 2016.02.29 v1.9

* Hỗ trợ mã hóa Shadowsocks ChaCha20;
* Thêm các trang kết nối trực tiếp hơn vào tệp cấu hình mặc định;
* Các cổng động bây giờ sẽ tự động tạo một tài khoản.

## 2016.02.22 v1.8

* Cập nhật tập lệnh cài đặt install-release.sh (cảm ơn, @netcookies): 
  * Bây giờ bạn có thể tự động dừng quá trình V2Ray và cập nhật tự động sau khi hoàn thành V2Ray;
  * Install-release.sh chấp nhận đối số --proxy và V2Ray chỉ định proxy tải xuống;
* Sử dụng trình biên dịch Go 1.6 để cải thiện hiệu suất mã hóa AES;
* Sửa lỗi nhỏ;
* Cập nhật IP máy chủ chính thức (vui lòng tải xuống lại gói cài đặt để nhận cấu hình mới nhất).

## 2016.02.08 v1.7

* Hiệu suất chuyển tiếp UDP được cải thiện;
* Bảo mật Shadowsocks được cải thiện;
* Sửa lỗi nhỏ;
* Chúc mừng năm mới!