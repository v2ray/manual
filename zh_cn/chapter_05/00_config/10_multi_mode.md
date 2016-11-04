# 同时开启KCP,TCP+动态端口四种
* 使用时记得去掉json里//开头的注释
* UUID 生成网站: https://www.uuidgenerator.net
```javascript
{
  "log": {
    "access": "/var/log/v2ray/access.log",  //访问日志路径自行修改
    "error": "/var/log/v2ray/error.log",    //错误日志路径自行修改
    "loglevel": "warning"
  },
  
  "inbound": {
    "port": 28000,       //kcp (udp) 监听端口
    "protocol": "vmess",
    "settings": {
      "clients": [
        {
          "id": "xx--xx-xx-xx",  //替换你的UUID不能重复，客户端记得对应
          "level": 1,            //客户端记得对应
          "alterId": 100            //客户端记得对应
        }
      ]
    },
    "streamSettings": {
      "network": "kcp"  //启用kcp
    }
  },
  
  "inboundDetour": [               //举例如果只想使用KCP一种inboundDetour的整个段就可以全部删除^_^
    {
      "port": 28000,       //tcp (tcp) 监听端口
      "protocol": "vmess",
      "settings": {
        "clients": [
          {
            "id": "xx--xx-xx-xx",  //替换你的UUID不能重复
            "level": 1,
            "alterId": 100
          }
        ]
      }
    },
    {
      "port": 28001,       //kcp (udp) 动态端口主监听端口
      "protocol": "vmess",
      "settings": {
        "clients": [
          {
            "id": "xx--xx-xx-xx",  //替换你的UUID不能重复
            "level": 1,
            "alterId": 100
          }
        ],
        "detour": {
          "to": "detour-kcp"
        }
      },
      "streamSettings": {
        "network": "kcp"
      }
    },
    {
      "port": 28001,       //tcp (tcp) 动态端口主监听端口
      "protocol": "vmess",
      "settings": {
        "clients": [
          {
            "id": "xx--xx-xx-xx",  //替换你的UUID不能重复
            "level": 1,
            "alterId": 100
          }
        ],
        "detour": {
          "to": "detour-tcp"
        }
      }
    },
    {
      "protocol": "vmess",
      "port": "50001-50100",   //kcp (udp)动态端口监听范围 
      "tag": "detour-kcp",
      "settings": {},
      "allocate": {
        "strategy": "random", //随机
        "concurrency": 2,     //开放2个端口
        "refresh": 5          //5分钟刷新一次
      },
      "streamSettings": {
        "network": "kcp"
      }
    },
    {
      "protocol": "vmess",
      "port": "50001-50100",   //tcp (tcp)动态端口监听范围 
      "tag": "detour-tcp",
      "settings": {},
      "allocate": {
        "strategy": "random",
        "concurrency": 2,
        "refresh": 5
      }
    }
  ],
  
  "outbound": {
    "protocol": "freedom",
    "settings": {}
  },
  
  "outboundDetour": [
    {
      "protocol": "blackhole",
      "settings": {},
      "tag": "blocked"
    }
  ],
  
  "routing": {
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
            "::1/128",
            "fc00::/7",
            "fe80::/10"
          ],
          "outboundTag": "blocked"
        }
      ]
    }
  },
  
  "transport": {
    "tcpSettings": {
      "connectionReuse": true
    },
    "kcpSettings": {
      "mtu": 1350,
      "tti": 20,
      "uplinkCapacity": 12,
      "downlinkCapacity": 100,
      "congestion": false,
      "readBufferSize": 1,
      "writeBufferSize": 1,
      "header": {
        "type": "none"
      }
    }
  }
}
```
