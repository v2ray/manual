# 黑名单模式

黑名单模式是指，默认不中转请求，只对指定的 IP 或域名才中转。

```javascript
{
  "port": 1080,
  "log": {
    "access": ""
  },
  "inbound": {
    "protocol": "socks",
    "settings": {
      "auth": "noauth",
      "udp": false,
      "ip": "127.0.0.1"
    }
  },
  "outbound": {
    "protocol": "freedom", // 默认直连，只有路由匹配的域名才转发
    "settings": {}
  },
  "outboundDetour": [
    {
      "protocol": "vmess",
      "tag": "blocked",
      "settings": {
        "vnext": [
          {
            "address": "195.154.64.131",
            "port": 17173,
            "users": [
              {"id": "d0609d48-f2d4-43c1-92ff-a077ca7222b4"}
            ]
          }
        ]
      }
    }
  ],
  "routing": {
    "strategy": "rules",
    "settings": {
      "rules": [
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
          "outboundTag": "blocked" // 与 VMess 协议的标签一致，所以匹配上述域名的请求将被中转
        }
      ]
    }
  }
}
```