# 黑名单模式

黑名单模式是指，默认不中转请求，只对指定的 IP 或域名才中转，可以实现类似PAC的效果。

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
    "protocol": "freedom", // 默认直连，只有路由匹配的域名或IP才转发
    "settings": {}
  },
  "outboundDetour": {
    "protocol": "vmess",    // 使用VMess协议作为额外传出协议
    "tag": "proxy_please",
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
  "routing": {
    "strategy": "rules",
    "settings": {
      "rules": [
        // ========== BEGIN ==========
        {
          "type": "field",
          "domain": [
            ".goo",  // 匹配所有包含".goo"的域名，如 www.google.com，www.googleapis.com
            "ggpht",
            "gstatic",
            "github",
            "facebook.com",
            "fbcdn.net",
            "youtube.com",
            "youtu.be",
            "ytimg.com",
            "twitter.com",
            "twimg.com",
            "twitpic.com",
            "t.co",
            "bitly.com",
            "j.mp",
            "bit.ly",
            "blogspot",
            "blogger",
            "blogblog",
            "dropbox.com",
            "flickr.com",
            "udn.com",
            "chinagfw.org",
            "godoc.org",
            "golang.org",
            "gravatar.com",
            "gstatic.com",
            "mediafire.com",
            "wikipedia.com",
            "wikipedia.org"
          ],
          "outboundTag": "proxy_please" // 额外传出协议的标签一致，所以匹配上述域名的请求将被中转
        },
        {
          "type": "field",
          "ip": [
            "91.108.4.0/22",
            "109.239.140.0/24"
          ],
          "outboundTag": "proxy_please"
        }
        // ========== END ==========
      ]
    }
  }
}
```

同理，我们不难发现，[默认配置](00_socks_client.md)中的配置含义是“默认所有请求都走中转，只有特定域名或IP（例如，内网地址）才直连”。
