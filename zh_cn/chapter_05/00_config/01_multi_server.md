# 单客户端连接多服务器

V2Ray 的客户端可以配置多个服务器，这种情况下，每次发送网络请求时，V2Ray 会随机选择一个服务器来中转数据。暂时没有更多的负载平衡选项。

```javascript
{
  "port": 1080,
  "inbound": {
    "protocol": "socks",  // 入口协议 SOCKS
    "settings": {
      "auth": "noauth",
      "udp": false
    }
  },
  "outbound": {
    "protocol": "vmess",
    "settings": {
      "vnext": [
        {
          "address": "1.1.1.1", // 第一个中转服务器 IP 地址
          "port": 10101,  // 服务器端口
          "users": [
            {"id": "e1d6c5b1-19ec-4a70-904d-e42f3126c96a"} // 用户 ID
          ]
        },
        {
          "address": "2.2.2.2", // 第二个中转服务器 IP 地址，以此类推
          "port": 20202,
          "users": [
            {"id": "77fdfd6f-e77b-4e81-b1b6-f2f0c9a32ac3"}
          ]
        },
        {
          "address": "3.3.3.3",
          "port": 30303,
          "users": [
            {"id": "ad939547-81ee-4399-8af2-bf9d4d209f64"}
          ]
        }
      ]
    }
  }
}
```