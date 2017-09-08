# 广告拦截

我们可以使用V2Ray的路由和黑洞协议配合，将已知的广告域名和广告服务器IP的流量发送到黑洞协议中，以达到简单的广告拦截效果。

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
        {
          "address": "1.2.3.4", // 服务器IP地址
          "port": 12345,        // 服务器端口
          "users": [
            {
              "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx", // UUID
              "alterId": 64,            // 额外ID，需要和服务器上配置相同
              "security": "aes-128-cfb" // 加密方式
            }
          ]
        }
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
    // ========== BEGIN STEP 1 ==========
    // 配置一个黑洞协议
    ,{
      "protocol": "blackhole",
      "tag": "block_request",
      "settings": {
        "response": {
          "type": "http"  // 自动回复 HTTP 403
        }
      }
    }
    // ========== END STEP 1 ==========
  ],
  "routing": {
    "strategy": "rules",
    "settings": {
      "domainStrategy": "IPIfNonMatch",
      "rules": [
          // ========== BEGIN STEP 2 ==========
          // 配置需要被拦截的域名和IP
          {
            "type": "field",
            "domain": [
              "msg.71.am",  // 要拦截的域名
              "17un.co"
            ],
            "outboundTag": "block_request"
            }，
            {
              "type": "field",
              "ip": [
                "12.34.56.78",  // 要拦截的IP
                "23.34.45.56"
              ],
              "outboundTag": "block_request"
            }，
          // ========== END STEP 2 ==========
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
