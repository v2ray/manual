# 服务器端动态端口

V2Ray 提供了[动态开启和关闭端口](../../chapter_02/03_routing.md)的功能，在服务器端进行一些配置，可以让客户端每隔一段时间就连接服务器的不同端口进行通信，以规避某些运营商的流量限制。

样例配置如下，和原有配置不一样的地方已标注。

```javascript
{
  "log" : {
    "access": "/var/log/v2ray/access.log",
    "error": "/var/log/v2ray/error.log",
    "loglevel": "warning"
  },
  "inbound": {
    "port": 37192,
    "protocol": "vmess",
    "settings": {
      "clients": [   // clients 部分和原有的配置的一样
        {
          "id": "3b129dec-72a3-4d28-aeee-028a0fe86e22",
          "level": 1,
          "alterId": 100
        }
      ],
      "detour": {             // 绕路配置
        "to": "detour" // 指定绕路协议的标签，要下面 inboundDetour 中的标签一样
      }
    }
  },
  "outbound": {
    "protocol": "freedom",
    "settings": {}
  },
  "inboundDetour": [
    {
      "protocol": "vmess",
      "port": "30001-30100",  // 按需开放 30001 到 300100 这 100 个端口
      "tag": "detour", // 和上面提到的标签一致
      "settings": {},
      "allocate": {            // 端口分配模式
        "strategy": "random",  // 随机开启
        "concurrency": 2,      // 同时开放两个端口
        "refresh": 5           // 每五分钟刷新一次
      }
    }
  ],
  "outboundDetour": [
    {
      "protocol": "blackhole",
      "settings": {},
      "tag": "blocked"
    }
  ],
  "routing": {              // 路由部分和原有配置一样
    "strategy": "rules",
    "settings": {
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
          "outboundTag": "blocked"
        }
      ]
    }
  }
}
```
