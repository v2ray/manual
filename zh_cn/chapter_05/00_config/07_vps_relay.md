# 国内 VPS 中转

为了维护方便，有时候在国内架设一台中转 VPS，在这台 VPS 上判断目标地址是国内还是国外的，只把国外的流量向国外 VPS 转发，而国内的流量使用直连。这样的配置，在用户的电脑只需要把所有流量发往这台 VPS，而不用为每一个用户都配置白名单，较为省力。

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
      "clients": [
        {
          "id": "3b129dec-72a3-4d28-aeee-028a0fe86e22",
          "level": 1
        }
      ]
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
      "protocol": "blackhole",
      "settings": {},
      "tag": "blocked"
    },
    {
      "protocol": "freedom",
      "tag": "direct",
      "settings": {}
    }
  ],
  "routing": {
    "strategy": "rules",
    "settings": {
      "rules": [
        {
          "type": "chinaip", // 对于所有国内的 IP，都采用直连模式
          "outboundTag": "direct"
        },
        {
          "type": "field",  // 对于一些常见的网站，也使用直连模式
          "domain": [
            "qq.com",
            "baidu.com"
          ],
          "outboundTag": "direct"
        },
        {
          "type": "field",  // 禁止访问局域网
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
