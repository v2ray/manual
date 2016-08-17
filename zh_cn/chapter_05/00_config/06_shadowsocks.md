# Shadowsocks 服务器端

V2Ray 在服务器端支持 Shadowsocks 协议，如果你同时在使用 V2Ray 和 Shadowsocks，那么服务器端可以同时开启两种协议，以减少维护成本。

下面是一个以 VMess 为主，同时开放 Shadowsocks 端口的配置：

```javascript
{
  "log" : {
    "access": "/var/log/v2ray/access.log", // 访问日志文件
    "error": "/var/log/v2ray/error.log",   // 错误日志文件
    "loglevel": "warning"                  // 错误日志等级，可选 debug / info / warning / error
  },
  "inbound": {
    "port": 37192, // 主端口
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
      "protocol": "shadowsocks",   // 开启 Shadowsocks
      "port": 30001, // 监听 30001 端口
      "settings": {
        "method": "aes-256-cfb", // 加密方式，支持 aes-256-cfb 和 aes-128-cfb
        "password": "v2ray",     // 密码，必须和客户端相同
        "udp": false             // 是否开启 UDP 转发
      }
    },
    {
      "protocol": "shadowsocks",   // 开启 Shadowsocks
      "port": 30002, // 监听 30002 端口，由于 Shadowsocks 的限制，多用户的时候只能开多个端口
      "settings": {  // 配置和上述类似
        "method": "aes-256-cfb",
        "password": "v2ray-2",
        "udp": false
      }
    }
  ],
  "outboundDetour": [
    {
      "protocol": "blackhole",  // 额外的传出协议，参见协议列表
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