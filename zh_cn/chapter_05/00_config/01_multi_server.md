# 单客户端连接多服务器

V2Ray 的客户端可以配置多个服务器，这种情况下，每次发送网络请求时，V2Ray 会随机选择一个服务器来中转数据。暂时没有更多的负载平衡选项。

```javascript
{
  "log": {
    "error": "/var/log/v2ray/error.log",
    "loglevel": "warning"
  },
  "inbound": {
    "port": 1080,           // 本地监听端口
    "listen": "127.0.0.1",
    "protocol": "socks",    // 使用 Socks(5) 传入协议
    "settings": {
      "auth": "noauth",     // 不认证
      "udp": false,         // 不开启 UDP 转发
      "ip": "127.0.0.1"
    }
  },
  "outbound": {
    "protocol": "vmess",    // 使用VMess协议作为传出协议
    "settings": {
      "vnext": [
          // ========== BEGIN ==========
          {
            "address": "1.1.1.1",   // 第一个服务器 IP 地址
            "port": 10101,          // 服务器端口
            "users": [
              {
                  "id": "aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa", // 用户 ID
                  "alterId": 64,            // 额外ID，需要和服务器上配置相同
                  "security": "aes-128-cfb" // 加密方式
              }
            ]
          },
          {
            "address": "2.2.2.2",   // 第二个服务器 IP 地址，以此类推
            "port": 20202,
            "users": [
              {
                  "id": "bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb", // 用户 ID
                  "alterId": 64,            // 额外ID，需要和服务器上配置相同
                  "security": "aes-128-cfb" // 加密方式
              }
            ]
          },
          {
            "address": "3.3.3.3",
            "port": 30303,
            "users": [
              {
                  "id": "cccccccc-cccc-cccc-cccc-cccccccccccc",
                  "alterId": 64,
                  "security": "aes-128-cfb"
              }
            ]
          }
          // ========== END ==========
      ]
    },
    "mux": {
      "enabled": true
    }
  },
  "outboundDetour": [
    {
      "protocol": "freedom",
      "settings": {},
      "tag": "direct"
    }
  ],
  "routing": {
    "strategy": "rules",
    "settings": {
      "domainStrategy": "IPIfNonMatch",
      "rules": [
        {
          "type": "field",
          "ip": [
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
          "outboundTag": "direct"
        },
        {
          "type": "chinaip",
          "outboundTag": "direct"
        }
      ]
    }
  }
}
```
