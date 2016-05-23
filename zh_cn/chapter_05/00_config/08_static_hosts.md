# 静态路由

由于可用的 IP 越来越少，使用 Hosts 翻墙已变得越来越难。但是如果你能找到可以直连的 IP，V2Ray 可以帮你加速访问这些网站。

示例配置如下（V2Ray 1.14+）

```javascript
{
  "port": 1080,
  "inbound": {
    "protocol": "socks",
    "settings": {
      "auth": "noauth",
      "udp": false
    }
  },
  "outbound": {
    "protocol": "vmess",
    "settings": {
      "vnext": [
        {
          // 略过
        }
      ]
    }
  },
  "outboundDetour": [
    {
      "protocol": "freedom",
      "settings": {
        "domainStrategy": "UseIP" // 使用内部 DNS 解析
      },
      "tag": "direct"
    }
  ],
  "dns": {
    "hosts": {
      "google.com": "220.255.2.153",
      "www.google.com": "220.255.2.153",
      "dns.google.com": "220.255.2.153"
    },
    "servers": [
      "8.8.8.8",
      "8.8.4.4"
    ]
  },
  "routing": {
    "strategy": "rules",
    "settings": {
      "rules": [
        {
          "type": "field",
          "domain": [
            "google.com",
          ],
          "outboundTag": "direct" // google.com 直连
        },
        {
          "type": "field",
          "ip": [            // 以下 IP 段将被转到 Freedom
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
          "outboundTag": "direct" // Freedom 的标签
        }
      ]
    }
  }
}
```
