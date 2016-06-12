# 广告拦截

使用 V2Ray 的路由和黑洞协议配合，可以做到简单的广告拦截效果。

```javascript
"outboundDetour": [
    {
      "protocol": "blackhole",
      "tag": "adblock",
      "settings": {
        "response": "http"  // 自动回复 HTTP 403
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
            "msg.71.am",  // 要拦截的域名
            "17un.co"
          ],
          "outboundTag": "adblock"
        }
      ]
    }
  }
```
