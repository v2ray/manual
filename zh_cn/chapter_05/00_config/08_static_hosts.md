# 静态路由

V2Ray 内置了一个 DNS 服务器。在已知某些网站真实IP的情况下，我们手动在V2Ray里配置Hosts。

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
      "settings": {
          // ========== BEGIN STEP 1 ==========
          "domainStrategy": "UseIP" // 使用内部 DNS 解析
          // ========== END STEP 1 ==========
      },
      "tag": "direct"
    }
  ],
  // ========== BEGIN STEP 2 ==========
  // 配置DNS
  "dns": {
    "hosts": {
      // 在这里使用键值对的形式配置hosts
      "my-computer": "127.0.0.1",
      "google.com": "220.255.2.153",
      "www.google.com": "220.255.2.153",
      "dns.google.com": "220.255.2.153"
    },
    "servers": [
      // 在这里可以指定其他DNS
      "8.8.8.8",
      "8.8.4.4"
    ]
  },
  // ========== END STEP 2 ==========
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
