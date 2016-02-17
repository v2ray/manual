# Dokodemo-door
Dokodemo door（任意门）是一个传入数据协议，它可以监听一个本地端口，并把所有进入此端口的数据发送至指定服务器的一个端口，从而达到端口映射的效果。

* 名称：dokodemo-door
* 类型：Inbound
* 配置：
```javascript
{
  "address": "8.8.8.8",
  "port": 53,
  "network": "tcp",
  "timeout": 0
}
```

其中：
* address：指定服务器的地址，可以是一个 IPv4、IPv6 或者域名，字符串类型。
* port：指定服务器的端口，数值类型。
* network：指定服务器的网络协议类型，目前仅支持 TCP。
* timeout：传入数据的时间限制（秒），0 表示无限制。