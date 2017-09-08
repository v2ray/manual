# Shadowsocks 服务器端

V2Ray 在服务器端支持 Shadowsocks 协议。服务器端可以同时开启 V2Ray 和 Shadowsocks 两种协议，以减少维护成本。

下面是一个以 VMess 为主，同时开放 Shadowsocks 端口的配置：

```javascript
{
  "log" : {                                 // [日志](../chapter_02/01_overview.md)
    "access": "/var/log/v2ray/access.log",  // 访问日志文件
    "error": "/var/log/v2ray/error.log",    // 错误日志文件
    "loglevel": "warning"                   // 错误日志等级
  },
  "inbound": {              // 主传入协议
    "port": 12345,          // 主端口
    "protocol": "vmess",    // 在这里使用 [VMess 协议](../chapter_02/protocols/vmess.md)
    "settings": {
      "clients": [
        {
          "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx", // UUID
          "level": 1,       // 用户等级
          "alterId": 64     // 额外ID
        }
        // 在这里添加更多用户，注意UUID不能重复
        ,{
          "id": "yyyyyyyy-yyyy-yyyy-yyyy-yyyyyyyyyyyy", // UUID
          "level": 0,       // 用户等级
          "alterId": 32     // 额外ID
        }
      ]
    }
  },
  "outbound": {             // 主传出协议
    "protocol": "freedom",  // 在这里使用“直接传出至互联网”
    "settings": {}
  },
  // ========== BEGIN ==========
  // 增加传入绕路，开启 Shadowsocks 协议
  "inboundDetour": [
    {
      "protocol": "shadowsocks",    // 开启 Shadowsocks 协议支持
      "port": 30001,                // 监听 30001 端口
      "settings": {
        "method": "aes-256-cfb", // 加密方式，支持 aes-256-cfb 和 aes-128-cfb
        "password": "v2ray",     // 密码，客户端必须与此相同
        "udp": false             // 是否开启 UDP 转发
      }
    },
    {
      "protocol": "shadowsocks",   // 开启 Shadowsocks 协议支持
      "port": 30002, // 监听 30002 端口，由于 Shadowsocks 的限制，多用户的时候只能开多个端口
      "settings": {  // 配置和上述类似
        "method": "aes-256-cfb",
        "password": "v2ray-2",
        "udp": false
      }
    }
  ],
  // ========== END ==========
  "outboundDetour": [       // 额外传出协议
    {
      "protocol": "blackhole",
      "settings": {},
      "tag": "blocked"
    }
  ],
  "routing": {                  // 路由设置
    "strategy": "rules",
    "settings": {
      "rules": [
        {
          "type": "field",      // 不允许客户端访问服务端的局域网地址，以提升安全性
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

配置完毕后，请在防火墙中做相应配置，以保证端口的可用性。
