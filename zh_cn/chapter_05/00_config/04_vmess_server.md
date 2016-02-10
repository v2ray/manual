# VMess 服务器端

本配置文件是一个典型的服务器端配置。

```javascript
{
  "port": 37192, // 主端口
  "log" : {
    "access": "/var/log/v2ray/access.log", // 访问日志文件
    "error": "/var/log/v2ray/error.log",   // 错误日志文件
    "loglevel": "warning"                  // 错误日志等级，可选 debug / info / warning / error
  },
  "inbound": {
    "protocol": "vmess",    // 主传入协议，参见协议列表
    "settings": {
      "clients": [
        {
          "id": "3b129dec-72a3-4d28-aeee-028a0fe86e22",  // 用户 ID，客户端须使用相同的 ID 才可以中转流量
          "level": 1  // 用户等级，自用 VPS 可设为 1；共享 VPS 请设为 0。
        }
      ]
    }
  },
  "outbound": {
    "protocol": "freedom",  // 主传出协议，参见协议列表
    "settings": {}
  },
  "inboundDetour": [
    {
      "protocol": "vmess",   // 可选，开启多个 VMess 端口
      "port": "30001-30010", // 开放 30001 到 300010 这 10 个端口
      "settings": {
        "clients": [  // VMess 配置，和主传入协议类似
          {
            "id": "3b129dec-72a3-4d28-aeee-028a0fe86e22",
            "level": 1
          }
        ]
      }
    }
  ],
  "outboundDetour": [
    {
      "protocol": "blackhole",  // 额外的传出协议，参见[协议列表](../chapter_02/02_protocols.md)。
      "settings": {},
      "tag": "blocked"
    }
  ],
  "routing": {
    "strategy": "rules",
    "settings": {
      "rules": [
        {
          "type": "field",  // 路由设置，默认将屏蔽所有局域网流量，以提升安全性。
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
          "outboundTag": "blocked"
        }
      ]
    }
  }
}

```