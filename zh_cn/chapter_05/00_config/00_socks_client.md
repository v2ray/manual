# SOCKS 5 客户端

```javascript
{
  "inbound": {
    "port": 1080, // 监听端口
    "protocol": "socks", // 入口协议为 SOCKS 5
    "settings": {
      "auth": "noauth",  // 不认证
      "udp": false       // 不开启 UDP 转发
    }
  },
  "outbound": {
    "protocol": "vmess", // 出口协议
    "settings": {
      "vnext": [
        {
          "address": "8.8.8.8", // 服务器 IP 地址
          "port": 17173,  // 服务器端口
          "users": [
            {"id": "d17a1af7-efa5-42ca-b7e9-6a35282d737f"} // 用户 ID，须与服务器端配置相同
          ]
        }
      ]
    }
  },
  "outboundDetour": [
    {
      "protocol": "freedom", // 额外的出口协议。Freedom 协议为直连模式，不经过服务器中转。
      "settings": {},
      "tag": "direct"  // 标签，在路由中用到
    }
  ],
  "routing": {
    "strategy": "rules",
    "settings": {
      "rules": [
        {
          "type": "field",
          "ip": [            // 以下 IP 段将被转到 Freedom
            "0.0.0.0/8",
            "10.0.0.0/8",
            "100.64.0.0/10",
            "127.0.0.0/8",
            "169.254.0.0/16",
            "172.16.0.0/12",
            "192.0.0.0/24",
            "192.0.2.0/24",
            "192.168.0.0/16",
            "198.18.0.0/15",
            "198.51.100.0/24",
            "203.0.113.0/24",
            "::1/128",
            "fc00::/7",
            "fe80::/10"
          ],
          "outboundTag": "direct" // Freedom 的标签
        }
      ]
    }
  }
}

```