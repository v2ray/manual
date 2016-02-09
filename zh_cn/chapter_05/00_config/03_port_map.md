# Remote Desktop 端口映射

V2Ray 提供了一种端口映射机制，可以将要访问的主机的某个端口映射到本地，访问本地端口，即相当于访问了远端主机上对应的端口。提供此功能的入口协议称为“dokodemo-door”，详见[[协议列表]]。

```javascript
{
  "port": 1080,
  "inbound": {  // 为了不影响正常使用，主入口协议依然使用 SOCKS。
    "protocol": "socks",
    "settings": {
      "auth": "noauth",
      "udp": false,
      "ip": "127.0.0.1"
    }
  },
  "outbound": {
    "protocol": "vmess",
    "settings": {
      "vnext": [
        {
          "address": "127.0.0.1",
          "port": 37192,
          "users": [
            {"id": "27848739-7e62-4138-9fd3-098a63964b6b"}
          ]
        }
      ]
    }
  },
  "inboundDetour": [
    {
      "protocol": "dokodemo-door",  // 一个额外的入口协议
      "port": 28394,  // 本地端口
      "settings": {
        "address": "1.2.3.4",  // 远程机器的 IP
        "port": 3389,          // 远程机器的端口
        "network": "tcp",      // 网络协议，支持"tcp"、"udp"和"tcp,udp"
        "timeout": 0           // 传输超时（秒），0 表示不检测超时
      }
    }
  ]
}
```