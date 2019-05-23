---
refcn: chapter_02/transport/websocket
refen: configuration/transport/websocket
---

# WebSocket

Sử dụng WebSocket chuẩn để truyền tải dữ liệu. Các kết nối Websocket có thể được proxy của Nginx ủy nhiệm.

## WebSocketObject

`WebSocketObject` được sử dụng như `wsSettings` trong `TransportObject` hoặc `StreamSettingsObject`.

{% hint style='info' %}

Websocket nhận ra tiêu đề HTTP X-Forwarded-For và sử dụng nó như là địa chỉ nguồn trong nước.

{% endhint %}

```javascript
{
  "path": "/",
  "headers": {
    "Host": "v2ray.com"
  }
}
```

> `path`: string

Đường dẫn được sử dụng cho WebSocket. Mặc định là root, là `"/"`.

> `headers`: map{string, string}

Tiêu đề HTTP tùy chỉnh. Một mảng trong đó mỗi mục nhập là một cặp giá trị khóa trong chuỗi, cho tiêu đề và giá trị trong tiêu đề HTTP. Mặc định trống.