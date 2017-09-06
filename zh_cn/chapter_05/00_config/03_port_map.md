# Remote Desktop 端口映射

V2Ray 提供了一种端口映射机制，可以将要访问的主机的某个端口映射到本地，访问本地端口，即相当于访问了远端主机上对应的端口。提供此功能的入口协议称为“dokodemo-door”，详见[协议列表](../../chapter_02/02_protocols.md)。

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
  "inboundDetour": [
      // ========== BEGIN ==========
      // 例子： 将 2.3.4.5 主机的 3389 端口影射到本地的 33890 端口
      {
        "protocol": "dokodemo-door",  // 一个额外的 dokodemo-door 入口协议
        "port": 33890,            // 本地端口
        "settings": {
          "address": "2.3.4.5",   // 远程主机的 IP
          "port": 3389,           // 远程主机被影射的端口
          "network": "tcp",       // 网络协议，支持"tcp"、"udp"和"tcp,udp"
          "timeout": 0            // 传输超时（秒），0 表示不检测超时
        }
      }
      // 例子： 将本地的 8080 端口影射到本地的 80 端口
      ,{
        "protocol": "dokodemo-door",  // 一个额外的 dokodemo-door 入口协议
        "port": 80,               // 本地端口
        "settings": {
          "address": "127.0.0.1", // 远程主机的 IP
          "port": 8080,           // 远程主机被影射的端口
          "network": "tcp",       // 网络协议，支持"tcp"、"udp"和"tcp,udp"
          "timeout": 0            // 传输超时（秒），0 表示不检测超时
        }
      }
      // ========== END ==========
  ],
  "outboundDetour": [
    {
      "protocol": "freedom",
      "settings": {},
      "tag": "direct"
    }
  ],
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
