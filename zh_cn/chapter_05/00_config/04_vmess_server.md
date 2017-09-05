# VMess 服务器端

V2Ray 既可以作为服务端，也可以作为客户端。

作为服务端时，我们习惯于使用 VMess 传入协议（或其他传入协议），然后将数据传输至互联网。

下面是 V2Ray 默认服务端配置。

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
