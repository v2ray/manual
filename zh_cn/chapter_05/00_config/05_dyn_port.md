# 服务器端动态端口

V2Ray 提供了[动态开启和关闭端口](../../chapter_02/03_routing.md)的功能，在服务器端进行一些配置（客户端配置无需作任何修改），可以让客户端每隔一段时间就连接服务器的不同端口进行通信，以规避某些运营商的流量限制。

下面是一个服务器端开启动态端口的配置示例。

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
      ],
      // ========== BEGIN STEP 1 ==========
      // 在这里指定绕路协议的标签
      "detour": {
        "to": "dynamic_port"  // 要和下面 inboundDetour 中的标签一样
      }
      // ========== END STEP 1 ==========
    }
  },
  "outbound": {             // 主传出协议
    "protocol": "freedom",  // 在这里使用“直接传出至互联网”
    "settings": {}
  },
  // ========== BEGIN STEP 2 ==========
  // 新增一个传入绕路，配置动态端口相关参数
  "inboundDetour": [
    {
      "protocol": "vmess",
      "port": "30001-30100",  // 按需开放 30001 到 30100 这 100 个端口
      "tag": "dynamic_port", // 和上面提到的标签一致
      "settings": {},
      "allocate": {            // 端口分配模式
        "strategy": "random",  // 随机开启
        "concurrency": 2,      // 同时开放两个端口
        "refresh": 5           // 每五分钟刷新一次
      }
    }
  ],
  // ========== END STEP 2 ==========
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

开启动态端口后，请在防火墙中做相应配置，以保证动态端口的可用性。
