# 配置文件总览

浏览前建议阅读[文件格式](./01_overview.md)理解整体框架
一些配置模板，请参考[vTemplate](https://github.com/KiriKira/vTemplate)

V2Ray 的配置文件参数位置如下，版本号为V3.16的配置文件
各协议请参考[协议列表](./02_protocols.md)确认对应协议名称和协议配置内容

```javascript{
  "log": {
    "access": "/var/log/v2ray/access.log",
    "error": "/var/log/v2ray/error.log",
    "loglevel": "warning"
  },
  "api": {
    "tag": "api",
    "services": [
      "HandlerService",
      "LoggerService",
      "StatsService"
    ]
  },
  "dns": {
    "hosts": {
      "baidu.com": "127.0.0.1"
    },
    "servers": [
      "8.8.8.8",
      "8.8.4.4",
      "localhost"
    ]
  },
//"stats": {},            //暂无配置样例
  "routing": {
    "strategy": "rules",
    "settings": {
      "domainStrategy": "AsIs",
      "rules": [
        {
          "type": "field",
          "domain": [
            "baidu.com",
            "qq.com",
            "geosite:cn"
          ],
          "ip": [
            "0.0.0.0/8",
            "10.0.0.0/8",
            "fc00::/7",
            "fe80::/10",
            "geoip:cn"
          ],
          "port": "0-100",
          "network": "tcp",
          "source": [
            "10.0.0.1",
          ],
          "user": [
            "love@v2ray.com"
          ],
          "inboundTag": [
            "tag-vmess"
          ],
          "outboundTag": "标识"
        },
        {
          "type": "field",
          "ip": "0.0.0.0/8",
          "outboundTag": "direct"
        },
        {
          "type": "field",
          "network": "udp",
          "outboundTag": "blocked"
        },
        {
          "type": "chinaip",
          "outboundTag": "direct"
        },
        {
          "type": "chinasites",
          "outboundTag": "direct"
        }
      ]
    }
  },
  "policy": {
    "levels": {
      "0": {
        "handshake": 4,
        "connIdle": 300,
        "uplinkOnly": 2,
        "downlinkOnly": 5,
        "statsUserUplink": false,
        "statsUserDownlink": false
      }
    },
    "system": {
      "statsInboundUplink": false,
      "statsInboundDownlink": false
    }
  },
  "inbound": {            //请注意仅能添加一个默认配置，多个配置请使用outboundDetour添加
    "port": 1080,
    "listen": "127.0.0.1",
    "protocol": "协议名称",
    "settings": {协议配置内容},
    "streamSettings": {底层传输设置},            //此内容请参考底层传输设置
    "tag": "标识",
    "domainOverride": ["http", "tls"]
  },
  "outbound": {            //请注意仅能添加一个默认配置，多个配置请使用outboundDetour添加
    "sendThrough": "0.0.0.0",
    "protocol": "协议名称",
    "settings": {协议配置内容},
    "tag": "标识",
    "streamSettings": {
      "network": "tcp",
      "security": "none",
      "tlsSettings": {
        "serverName": "v2ray.com",
        "allowInsecure": false,
        "alpn": ["http/1.1"],
        "certificates": [
          {
          "usage": "encipherment",
          "certificateFile": "/path/to/certificate.crt",
          "keyFile": "/path/to/key.key",
          },
          {
          "usage": "encipherment",
          "certificate": [证书文本内容],
          "key": [证书文本内容],
          }
        ]
      },
      "tcpSettings": {参考最下方全局配置},
      "kcpSettings": {参考最下方全局配置},
      "wsSettings": {参考最下方全局配置},
      "httpSettings": {参考最下方全局配置}
    },
    "proxySettings": {
      "tag": "another-outbound-tag"
    },
    "mux": {}
  },
  "inboundDetour": [
    {
      "protocol": "协议名称",
      "port": "端口",
      "tag": "标识",
      "listen": "172.16.0.1",
      "allocate": {
        "strategy": "always",
        "refresh": 5,
        "concurrency": 3
      },
      "settings": {协议配置内容},
      "streamSettings": {底层传输设置},
      "domainOverride": ["http", "tls"]
    }
  ],
  "outboundDetour": [
    {
      "protocol": "协议名称",
      "sendThrough": "10.0.0.1",
      "tag": "标识",
      "settings": {协议配置内容},
      "streamSettings": {底层传输设置},
      "proxySettings": {
        "tag": "another-outbound-tag"
      },
      "mux": {}
    }
  ],
  "transport": {            //此部分内容为底层传输设置的全局设置，也可以在每个协议中单独指定
    "tcpSettings": {
      "type": "none"
    },
    "kcpSettings": {
      "mtu": 1350,
      "tti": 20,
      "uplinkCapacity": 5,
      "downlinkCapacity": 20,
      "congestion": false,
      "readBufferSize": 1,
      "writeBufferSize": 1,
      "header": {
        "type": "none"
      }
    },
    "wsSettings": {
//    "allowPassive": true,            //已于 v2.18 版本移除，现在的行为相当于 allowPassive = true 。
//    "connectionReuse": true,            //已于 v2.23 版本移除，现在被 Mux 参数替代。
      "path": "/random/path",
      "headers": {
        "Host": "v2ray.com"
      }
    },
    "httpSettings": {
      "host": [
        "v2ray.com",
        "projectv.com",
      ],
      "path": "/random/path"
    }
  }
}
```
