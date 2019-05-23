---
refcn: chapter_02/transport/mkcp
refen: configuration/transport/mkcp
---

# mKCP Transport

mKCP là một phương tiện giao thông đáng tin cậy. Nó là một giao thức dựa trên UDP. mKCP gửi nhiều lưu lượng truy cập hơn cho độ trễ thấp hơn. Để chuyển cùng một lượng dữ liệu, mKCP thường đòi hỏi nhiều thông lượng hơn TCP.

## KcpObject

```javascript
{
  "mtu": 1350,
  "tti": 20,
  "uplinkCapacity": 5,
  "downlinkCapacity": 20,
  "congestion": false,
  "readBufferSize": 1,
  "writeBufferSize": 1,
  "header": {
    "type": "none"
  }
}
```

> `mtu`: number

Đơn vị truyền tối đa. Nó chỉ ra số byte tối đa mà gói UDP có thể mang theo. Giá trị được đề xuất nằm trong khoảng từ `576` đến `1460`. Giá trị mặc định `1350`.

> `tti`: number

Khoảng thời gian truyền, tính bằng mili giây. mKCP gửi dữ liệu trong khoảng thời gian này. Giá trị được đề xuất nằm trong khoảng từ `10` đến `100`. Giá trị mặc định `50`.

> `uplinkCapacity`: number

Băng thông Uplink, tính bằng MB / s. Băng thông tối đa cho phiên bản V2Ray để tải dữ liệu lên một thiết bị từ xa. Giá trị mặc định là `5`. Xin lưu ý rằng nó là byte (tính bằng MB / s), không phải bit. Người ta có thể sử dụng giá trị `0` cho một băng thông nhỏ.

> `downlinkCapacity`: number

Băng thông đường xuống, tính bằng MB / s. Băng thông tối đa cho phiên bản V2Ray để tải xuống dữ liệu. Giá trị mặc định là `20`. Xin lưu ý rằng nó là byte (tính bằng MB / s), không phải bit. Người ta có thể sử dụng giá trị `0` cho một băng thông nhỏ.

{% hint style='info' %}

`uplinkCapacity` và `downlinkCapacity` xác định tốc độ của mKCP. Ở phía máy khách, `uplinkCapacity` chỉ định tốc độ cho máy khách gửi dữ liệu đến máy chủ. Ở phía máy chủ, `downlinkCapacity` chỉ định tốc độ nhận dữ liệu của máy chủ. Tối thiểu của cặp này có hiệu quả trong một kết nối thực tế.

{% endhint %}

> `congestion`: true | false

Có hay không để cho phép kiểm soát tắc nghẽn. Giá trị mặc định là `false`. Khi điều khiển tắc nghẽn được bật, V2Ray sẽ phát hiện chất lượng mạng. Nó sẽ gửi các gói ít hơn khi mất gói dữ liệu nghiêm trọng, hoặc nhiều dữ liệu hơn khi mạng không được điền đầy đủ.

> `readBufferSize`: number

Đọc kích thước bộ đệm cho một kết nối duy nhất, tính bằng MB. Giá trị mặc định là `2`.

> `writeBufferSize`: number

Ghi kích thước bộ đệm cho một kết nối duy nhất, tính bằng MB. Giá trị mặc định là `2`.

> `header`: [HeaderObject](#headerobject)

Cấu hình cho obfuscation tiêu đề gói.

### HeaderObject

```javascript
{
  "type": "none"
}
```

> `type`: string

Loại obfuscation. Proxy tương ứng vào và ra phải có cùng cài đặt. Lựa chọn là:

* `"none"`: Giá trị mặc định. Không có obfuscation được sử dụng.
* `"srtp"`: Làm xáo trộn lưu lượng truy cập SRTP. Nó có thể được công nhận là cuộc gọi video như FaceTime.
* `"utp"`: Làm xáo trộn lưu lượng truy cập uTP. Nó có thể được công nhận là lưu lượng truy cập Bittorrent.
* `"wechat-video"`: Làm xáo trộn lưu lượng truy cập WeChat.
* `"dtls"`: Obfuscated dưới dạng gói tin 1.2.
* `"wireguard"`: Làm xáo trộn các gói WireGuard. (KHÔNG đúng giao thức WireGuard)

## Tín dụng {#credits}

* @ skywind3000 đã phát minh ra giao thức KCP gốc và được triển khai trong C.
* @xtaci tái triển khai giao thức KCP trong Go.
* @xiaokangwang tích hợp KCP vào V2Ray.