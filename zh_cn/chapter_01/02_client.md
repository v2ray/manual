# 客户端配置

本文仅描述 Windows 和 Mac OS X 中的 V2Ray 客户端配置，如果你在 Linux 桌面系统上使用 V2Ray，请参考 [服务器配置](03_server.md)。

## 修改配置文件
### 文件位置：
* 如果你使用了 V2Ray 的官方发行版，在下载的压缩中可以找到默认的配置文件： config.json，使用任何文本编辑器打开即可修改；
* 如果你从复制了 Git 仓库，可以在 [vpoint_socks_vmess.json](https://github.com/v2ray/v2ray-core/blob/master/release/config/vpoint_socks_vmess.json) 文件中提取默认的配置。
 
配置文件，格式如下：
```javascript
{
  "port": 1080, // 监听端口
  "log" : {
    "access": "" // 访问记录，目前只在服务器端有效，这里留空
  },
  "inbound": {
    "protocol": "socks",  // 传入数据所用协议
    "settings": {
      "auth": "noauth", // 认证方式，暂时只支持匿名
      "udp": false, // 如果要使用 UDP 转发，请改成 true
      "ip": "127.0.0.1" // 如果 Server A 不是运行在本地，请标明 Server A（客户端）的实际 IP 地址，否则 UDP 转发将无法进行。
    }
  },
  "outbound": {
    "protocol": "vmess", // 中继协议，暂时只有这个
    "settings": {
      "vnext": [
        {
          "address": "127.0.0.1", // Server B（服务器）的 IP 地址，IPv4 或 IPv6，不支持域名
          "port": 27183, // Server B 的监听端口，请更换成其它的值
          "users": [
            // 用户 ID，必须包含在 Server B（服务器）的配置文件中。此 ID 将被用于通信的认证。
            // 为了安全，请自行更换随机的 ID，可以使用 https://www.uuidgenerator.net/ 来生成新的 ID。
            {"id": "ad937d9d-6e23-4a5a-ba23-bce5092a7c51"}
          ]
        }
      ]
    }
  }
}
```

### 注意事项
* V2Ray 的用户验证基于时间，请确保 A 和 B 所在机器的系统时间误差在一分钟以内。
* json 配置文件实际上不支持注释（即“//”之后的部分，在使用时请务必删去）。

## 运行

1. 请将配置文件保存为 config.json，并放置于 V2Ray 程序同一目录下
2. 在 Windows 中直接双击 v2ray.exe 即可；
3. 在 Mac OS X 中，右击 v2ray 文件，选择“Open With” -> “Terminal.app”

## 测试服务器可用性

curl -v --socks5-hostname 127.0.0.1:1080 https://www.google.com/

## 调试

使用过程中遇到任何问题，请参考[常见错误信息](04_errors.md)。