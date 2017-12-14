# 传出代理

通常，如果用了一台 VPS 进行流量中转，我们都要有这台 VPS 操作权限对 VPS 进行一定设置才能将客户端发来的数据包中转到目的 VPS。但是，很多情况下，我们只有别人提供的 Shadowsocks 账户而不具有 VPS 操作权限，除非是这台 VPS 的所有者进行相关设置，一般我们是无法利用该 VPS 作为中转服务器。

V2Ray 自 v2.6 起新增了一个传出代理功能，这个功能可以将一个传出协议发出的数据转发至另一传出协议。传出代理解决了两个问题：一是可以别人使用提供的 Shadowsocks 帐户所属的 VPS 作为中转服务器（也就是说不需要对服务器进行额外的配置或设定）；二是基于一的情况下该 VPS 中转的数据包是经过 V2Ray 加密后的数据包，无法获知你访问了什么网站的数据，只能得到目的 VPS 的 IP 以及客户端 IP，有效地保证隐私安全。

## 原理

参考这个 [issue](https://github.com/v2ray/v2ray-core/issues/306)

## 使用方法

1. 添加一个中转服务器的 outbound，必须有一个 tag
1. 在目的 VPS 的 outbound 中添加一个 proxySettings 对象，proxySettings.tag 的值设为中转服务器 outbound.tag 的值

*[注]*:所有服务器都不需要额外的设定，只需修改客户端的配置文件

```javascript
{
  "inbound": {
    "port": 8080,
    "protocol": "socks",
    "settings": {
      "auth": "noauth",
      "timeout": 0
    },
  },
  "outbound": {
    "protocol": "vmess",
    "settings": { // settings 的根据实际情况修改
      "vnext": [
        {
          "address": "1.2.3.4",
          "port": 8888,
          "users": [
            {
              "alterId": 64,
              "id": "b12614c5-5ca4-4eba-a215-c61d642116ce"
            }
          ]
        }
      ]
    },
    "streamSettings": {
      "network": "tcp"  // 此处不能是 "kcp"，设成 "kcp" 将无法联网
    },
    "proxySettings": {
        "tag": "transit"  // 这里的 tag 必须跟作为中转 VPS 的 tag 一致，这里设定的是 "transit"
      }
  },
  "outboundDetour": [
    {
      "protocol": "shadowsocks",
      "settings": {
        "servers": [
          {
            "address": "2.2.2.2",
            "method": "aes-256-cfb",
            "ota": false,
            "password": "password",
            "port": 1024
          }
        ]
      },
      "tag": "transit"
    }
  ]
}
```
