---
refcn: chapter_02/policy
refen: configuration/policy
---

# Chính sách địa phương

Chính sách cục bộ quản lý cài đặt chính sách của phiên bản V2Ray hiện tại, chẳng hạn như thời gian chờ kết nối. Các policys có thể được áp dụng cho mỗi cấp độ người dùng, hoặc toàn bộ hệ thống.

## PolicyObject

`PolicyObject` được sử dụng làm trường `chính sách` trong cấu hình cấp cao nhất.

```javascript
{
  "levels": {
    "0": {
      "handshake": 4,
      "connIdle": 300,
      "uplinkOnly": 2,
      "downlinkOnly": 5,
      "statsUserUplink": false,
      "statsUserDownlink": false
    }
  },
  "system": {
    "statsInboundUplink": false,
    "statsInboundDownlink": false
  }
}
```

> `level`: map{string: [LevelPolicyObject](#levelpolicyobject)}

Một danh sách các cặp giá trị khóa. Mỗi khóa là một chuỗi số nguyên (bị giới hạn bởi JSON), chẳng hạn như `"0"`, `"1"`, v.v. Giá trị số cho một cấp độ người dùng nhất định.

{% hint style='info' %}

Mức người dùng có thể được đặt trên mỗi proxy gửi đến và đi. V2Ray sẽ áp dụng các chính sách khác nhau dựa trên cấp độ người dùng.

{% endhint %}

> `system`: [SystemPolicyObject](#systempolicyobject)

Chính sách toàn hệ thống

### LevelPolicyObject

```javascript
{
  "handshake": 4,
  "connIdle": 300,
  "uplinkOnly": 2,
  "downlinkOnly": 5,
  "statsUserUplink": false,
  "statsUserDownlink": false,
  "bufferSize": 10240
}
```

> `handshake`: number

Thời gian chờ để thiết lập kết nối, tính bằng giây. Giá trị mặc định `4`. Ở giai đoạn bắt tay của một proxy gửi đến đối phó với một kết nối mới, hãy nói tiêu đề yêu cầu đọc VMess, nếu nó mất nhiều hơn `bắt tay` lần, V2Ray sẽ hủy kết nối.

> `connIdle`: number

Hết thời gian chờ kết nối không hoạt động, tính bằng giây. Giá trị mặc định `300`. Nếu không có dữ liệu nào được truyền qua kết nối trong `connIdle` , V2Ray sẽ hủy kết nối.

> `uplinkOnly`: number

Thời gian để giữ các kết nối mở sau khi đường lên của kết nối được đóng lại, tính bằng giây. Giá trị mặc định `2`. Sau khi remote (server) đóng đường xuống của kết nối, V2Ray sẽ hủy kết nối sau `uplinkOnly` lần.

> `downlinkOnly`: number

Thời gian để giữ các kết nối mở sau khi đường xuống của kết nối bị đóng, tính bằng giây. Giá trị mặc định `5`. Sau khi máy khách (trình duyệt) đóng đường lên của kết nối, V2Ray hủy bỏ kết nối sau `downlinkChỉ` lần.

{% hint style='tip' %}

Trong một kịch bản trình duyệt trang web đơn giản, nó là an toàn để thiết lập `uplinkOnly` và `downlinkOnly` cả đến `0`, cho hiệu suất tốt hơn.

{% endhint %}

> `statsUserUplink`: true | false

Khi được đặt thành `true`, V2Ray cho phép bộ đếm stat để lưu lượng truy cập đường lên cho tất cả người dùng ở cấp này.

> `statsUserDownlink`: true | false

Khi được đặt thành `true`, V2Ray cho phép bộ đếm stat truy cập đường xuống cho tất cả người dùng ở cấp này.

> `bufferSize`: number

Kích thước của bộ đệm trong mỗi kết nối, tính bằng kilo-byte. Giá trị mặc định là `10240`. Khi nó được đặt thành `0`, bộ đệm bên trong bị tắt.

Default value (V2Ray 4.4+):

* `0` on ARM, MIPS and MIPSLE.
* `4` on ARM64, MIPS64 and MIPS64LE.
* `512` on other platforms.

Default value (V2Ray 4.3-):

* `16` on ARM, ARM64, MIPS, MIPS64, MIPSLE and MIPS64LE.
* `2048` on other platforms.

{% hint style='info' %}

`bufferSize` overrides `v2ray.ray.buffer.size` settings in [env variables](env.md#cache-size-per-connection).

{% endhint %}

### SystemPolicyObject

```javascript
{
  "statsInboundUplink": false,
  "statsInboundDownlink": false
}
```

> `statsInboundUplink`: true | false

When set to `true`, V2Ray enables stat counter for all uplink traffic in all inbound proxies.

> `statsInboundDownlink`: true | false

When set to `true`, V2Ray enables stat counter for all downlink traffic in all inbound proxies.