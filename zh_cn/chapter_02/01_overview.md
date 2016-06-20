# 配置文件格式
V2Ray 的配置文件形式如下，客户端和服务器通用一种形式，只是实际的配置不一样。

```javascript
{
  "log": {},
  "dns": {},
  "routing": {},
  "inbound": {},
  "outbound": {},
  "inboundDetour": {},
  "outboundDetour": {},
  "transport": {}
}
```

其中：
* port: V2Ray 进程的主端口，它的取值是一个正整数，可以根据实际情况选取；
* log: 日志配置，见下文；
* dns: DNS 配置，见下文；
* routing: 路由配置，见下文；
* inbound: 传入连接配置，见下文；
* outbound: 传出连接配置，见下文；
* inboundDetour: 额外的传入连接配置，见下文；
* outboundDetour: 额外的传出连接配置，见下文；
* transport: 底层传输配置，见下文。
 
## 日志配置（log）
```javascript
{
  "access": "文件地址",
  "error": "文件地址",
  "loglevel": "warning"
}
```

其中：
* access: 访问日志的文件地址，其值可以是：
  * 一个合法的文件地址，如 /tmp/v2ray\_access.log （Linux）或者 C:\Temp\v2ray\_access.log（Windows）；
  * 或者留空表示不记录访问日志。
* error: 错误日志的文件地址，其值可以是：
  * 一个合法的文件地址，如 /tmp/v2ray\_error.log （Linux）或者 C:\Temp\v2ray\_error.log（Windows）；
  * 或者留空表示不记录错误日志。
* loglevel: 错误日志的级别，可选的值为 debug、info、warning、error 和 none：
  * 其中 debug 记录的数据最多，error 记录的最少；
  * none 表示不记录任何内容 （V2Ray 1.13+）；
  * 默认值为 warning。

## DNS 配置（dns）
内置的 DNS 服务器，若此项不存在，则默认使用本机的 DNS 设置。详见[DNS 配置](04_dns.md)

## 路由配置（routing）
```javascript
{
  "strategy": "rules",
  "settings": {
    "rules": [
      {
        "type": "field",
        "domain": [
          "baidu.com",
          "qq.com"
        ],
        "outboundTag": "direct"
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
      }
    ]
  }
}
```
其中：
* strategy: 路由模式，目前只有"rules"一个值；
* settings: 具体内容详见[路由配置](03_routing.md)；


## 主传入连接配置（inbound）
传入连接用于接收从客户端（浏览器或上一级代理服务器）发来的数据，可用的协议请见[[协议列表]]。

```javascript
{
  "port": 1080,
  "listen": "127.0.0.1",
  "protocol": "协议名称",
  "settings": {},
  "streamSettings": {
    "network": "tcp"
  }
}
```

其中：
* port: 端口。
* listen: 监听地址，只允许 IP 地址，默认值为 0.0.0.0。
* protocol: 连接协议名称，可选的值见[协议列表](02_protocols.md)。
* settings: 具体的配置内容，视协议不同而不同。
* streamSettings (V2Ray 1.17+): 流式传输协议配置：
  * network: 数据流所使用的网络，可选的值为 "tcp" 或 "kcp"，默认值为 "tcp"；
    * 目前仅有 VMess 协议支持 kcp，其它协议在 kcp 上会传输失败。

## 主传出连接配置（outbound）
主传出连接用于向远程网站或下一级代理服务器发送数据，可用的协议请见[[协议列表]]。

```javascript
{
  "sendThrough": "0.0.0.0",
  "protocol": "协议名称",
  "settings": {},
  "streamSettings": {
    "network": "tcp"
  }
}
```

其中：
* sendThrough: 用于发送数据的 IP 地址，当主机有多个 IP 地址时有效，默认值为 0.0.0.0。
* protocol: 连接协议名称，可选的值见[协议列表](02_protocols.md)。
* settings: 具体的配置内容，视协议不同而不同。
* streamSettings: 流式传输协议配置（见“主传入连接配置”） 。

## 额外的传入连接配置（inbound detour）
此项是一个数组，可包含多个连接配置，每一个配置形如：
```javascript
{
  "protocol": "协议名称",
  "port": "端口",
  "tag": "标识",
  "listen": "127.0.0.1",
  "allocate": {
    "strategy": "always",
    "refresh": 5,
    "concurrency": 3
  },
  "settings": {},
  "streamSettings": {
    "network": "tcp"
  }
}
```

其中：
* protocol: 连接协议名称，可选的值见[协议列表](02_protocols.md)。
* port: 端口号，可以是一个数值，或者字符串形式的数值范围，比如 "5-10" 表示端口 5 到端口 10 这 6 个端口。
* tag (V2Ray 1.5+): 此传入连接的标识，用于在其它的配置中定位此连接。属性值必须在所有 tag 中唯一。
* listen: 监听地址，只允许 IP 地址，默认值为 0.0.0.0。
* allocate (V2Ray 1.5+): 分配设置：
  * strategy: 分配策略，可选的值有 always 和 random 两个。always 表示总是分配所有已指定的端口，port 是指定了多少个端口，V2Ray 就会监听这些端口。random 表示随机开放端口，每隔 refresh 分钟在 port 范围中随机选取 concurrency 个端口来监听。
  * refresh: 随机端口刷新间隔，单位为分钟。最小值为 2，建议值为 5。这个属性仅当 strategy = random 时有效。
  * concurrency: 随机端口数量。最小值为 1，最大值为 port 范围的一半。建议值为 3。
* settings: 具体的配置内容，视协议不同而不同。
* streamSettings: 流式传输协议配置（见“主传入连接配置”） 。

### 额外的传出连接配置（outbound detour）
此项是一个数组，可包含多个连接配置，每一个配置形如：
```javascript
{
  "protocol": "协议名称",
  "sendThrough": "0.0.0.0",
  "tag": "标识",
  "settings": {},
  "streamSettings": {
    "network": "tcp"
  }
}
```

其中：
* protocol: 连接协议名称，可选的值见[协议列表](02_protocols.md)；
* sendThrough: 用于发送数据的 IP 地址，当主机有多个 IP 地址时有效，默认值为 0.0.0.0。
* tag: 当前的配置标识，当路由选择了此标识后，数据包会由此连接发出；
* settings: 具体的配置内容，视协议不同而不同。
* streamSettings: 流式传输协议配置（见“主传入连接配置”） 。

## 底层传输配置（transport）
用于配置 V2Ray 如何与其它服务器建立和使用网络连接。
```javascript
{
  "tcpSettings": {
    "connectionReuse": true
  },
  "kcpSettings": {
    "mtu": 1350,
    "tti": 20,
    "uplinkCapacity": 5,
    "downlinkCapacity": 20,
    "congestion": false
  }
}
```

其中：
* tcpSettings (V2Ray 1.17+): 针对 TCP 连接的配置：
  * connectionReuse: 是否重用 TCP 连接，默认值为 true。
    * 目前只对 VMess 起作用；
    * 当值为 true 时，V2Ray 会在传输完一段数据之后，继续使用同一个 TCP 连接来传输下一段数据。
* kcpSettings (V2Ray 1.17+): 针对 KCP 连接的配置：
  * mtu: 最大传输单元（maximum transmission unit），请选择一个介于 576 - 1460 之间的值。默认值为 1350。
  * tti (V2Ray 1.17.1+): 传输时间间隔（transmission time interval），单位毫秒（ms），KCP 将以这个时间频率发送数据。请选译一个介于 10 - 100 之间的值，默认值为 20。
  * uplinkCapacity (V2Ray 1.17.1+): 上行链路容量，即主机发出数据所用的最大带宽，单位 MB，默认值 5。注意是 Byte 而非 bit。
  * downlinkCapacity (V2Ray 1.17.1+): 下行链路容量，即主机接收数据所用的最大带宽，单位 MB，默认值 20。注意是 Byte 而非 bit。
  * congestion (V2Ray 1.17.1+): 是否启用拥塞控制，默认值为 false。
