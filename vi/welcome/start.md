---
refcn: chapter_00/start
refen: welcome/start
---
# Bắt đầu nhanh

Bạn cần phải cấu hình V2Ray sau khi cài đặt nó. Đây là một cấu hình nhanh cho chạy thử. Vui lòng xem [tổng quan về cấu hình](../configuration/overview.md) để có thêm thiết lập nâng cao.

## Khách hàng {#client}

Trên PC của bạn (hoặc di động), chạy V2Ray với cấu hình sau.

```javascript
{
  "inbounds": [{
    "port": 1080,  // Port of socks5 proxy. Trỏ trình duyệt của bạn để sử dụng cổng này.
    "listen": "127.0.0.1",
    "protocol": "socks",
    "settings": {
      "udp": true
    }
  }],
  "outbounds": [{
    "protocol": "vmess",
    "settings": {
      "vnext": [{
        "address": "server", // Address of your V2Ray server. Có thể là địa chỉ IP hoặc tên miền.
        "port": 10086,  // Port of your V2Ray server.
        "users": [{ "id": "b831381d-6324-4d53-ad4f-8cda48b30811" }]
      }]
    }
  },{
    "protocol": "freedom",
    "tag": "direct",
    "settings": {}
  }],
  "routing": {
    "strategy": "rules",
    "settings": {
      "domainStrategy": "IPOnDemand",
      "rules": [{
        "type": "field",
        "ip": ["geoip:private"],
        "outboundTag": "direct"
      }]
    }
  }
}
```

Vui lòng sửa đổi địa chỉ IP của máy chủ V2Ray của bạn như đã đề cập ở trên. Sau đó, quá trình V2Ray trên máy tính của bạn sẽ ủy quyền tất cả lưu lượng truy cập đến máy chủ V2Ray ngoại trừ lưu lượng truy cập mạng nội bộ.

## Máy chủ {#server}

Bạn cần một máy tính khác để chạy V2Ray làm máy chủ. Thông thường máy tính này nằm bên ngoài tường lửa. Đây là một cấu hình mẫu.

```javascript
{
  "inbounds": [{
    "port": 10086, // Port of the server. Phải giống như trên.
    "protocol": "vmess",
    "settings": {
      "clients": [{ "id": "b831381d-6324-4d53-ad4f-8cda48b30811" }]
    }
  }],
  "outbounds": [{
    "protocol": "freedom",
    "settings": {}
  }]
}
```

Vui lòng đảm bảo rằng trường `id` giống nhau giữa máy khách và máy chủ.

## Đang chạy {#running}

* Trên Windows và macOS, tệp cấu hình nằm trong cùng thư mục với nhị phân V2Ray. Bạn có thể chạy `v2ray` hoặc `v2ray.exe` mà không cần tham số bổ sung.
* Trên Linux, tệp cấu hình thường nằm ở `/etc/v2ray/config.json`. Chạy `v2ray --config = / etc / v2ray / config.json` trong nền trước hoặc sử dụng các công cụ khác như systemd để chạy V2Ray làm quá trình nền.

Xem [Tổng quan](../configuration/overview.md) để biết thêm chi tiết về cấu hình.