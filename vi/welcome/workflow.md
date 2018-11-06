---
refcn: chapter_00/workflow
refen: welcome/workflow
---
# Quy trình làm việc

## Máy chủ đơn

Giống như các proxy khác, bạn cần một máy chủ proxy chạy V2Ray. Sau đó, bạn có thể kết nối với internet thông qua máy chủ đó từ máy tính, thiết bị di động hoặc các thiết bị khác.

![thẳng thắn](../resources/direct.png)

V2Ray hỗ trợ kết nối từ nhiều thiết bị cùng một lúc, với các giao thức tùy chọn khác nhau. Trong thời gian đó, cơ chế định tuyến cục bộ chỉ có thể ủy quyền thông minh các kết nối cần thiết.

## Server Bridge

Trong trường hợp bạn không muốn cấu hình V2Ray trên mỗi thiết bị của mình, bạn có thể thiết lập máy chủ trong tường lửa và sau đó tất cả lưu lượng truy cập đi qua máy chủ đó. Máy chủ định tuyến chính nó.

![tiếp sức](../resources/relay.png)

## Nội bộ

Nội bộ của V2Ray trông giống như bên dưới. Nó hỗ trợ nhiều proxy gửi đến, và nhiều outbounds. Mỗi người trong số họ là độc lập với những người khác.

![nội bộ](../resources/internal.svg)

Ghi chú:

* Bạn phải định cấu hình ít nhất một lượt vào và ra ngoài để làm cho V2Ray hoạt động chính xác.
* Proxy gửi đến giao tiếp với phần mềm ứng dụng khách như trình duyệt.
* Proxy đi giao tiếp với máy chủ từ xa, chẳng hạn như Apache cho một trang web.
* Điều phối viên chịu trách nhiệm chọn một đường đi cho một kết nối nhất định, dựa trên các quy tắc có thể cấu hình được.

Cấu hình chi tiết có thể được tìm thấy [ở đây](../configuration/overview.md).