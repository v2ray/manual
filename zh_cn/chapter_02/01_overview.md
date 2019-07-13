---
refcn: chapter_02/01_overview
refen: configuration/overview
---

# 配置文件格式

V2Ray 的配置文件形式如下，客户端和服务器通用一种形式，只是实际的配置不一样。

```javascript
{
  "log": {},
  "api": {},
  "dns": {},
  "stats": {},
  "routing": {},
  "policy": {},
  "reverse": {},
  "inbounds": [],
  "outbounds": [],
  "transport": {}
}
```

> `log`: [LogObject](#logobject)

日志配置，表示 V2Ray 如何输出日志。

> `api`: [ApiObject](api.md)

内置的远程控置 API，详见[远程控制配置](api.md)。

> `dns`: [DnsObject](04_dns.md)

内置的 DNS 服务器，若此项不存在，则默认使用本机的 DNS 设置。详见[DNS 配置](04_dns.md)

> `routing`: [RoutingObject](03_routing.md)

[路由配置](03_routing.md)

> `policy`: [PolicyObject](policy.md)

本地策略可进行一些权限相关的配置，详见[本地策略](policy.md)

> `inbounds`: \[[InboundObject](#inboundobject)\]

一个数组，每个元素是一个[入站连接配置](#inboundobject)。

> `outbounds`: \[[OutboundObject](#outboundobject)\]

一个数组，每个元素是一个[出站连接配置](#outboundobject)。列表中的第一个元素作为主出站协议。当路由匹配不存在或没有匹配成功时，流量由主出站协议发出。

> `transport`: [TransportObject](05_transport.md)

用于配置 V2Ray 如何与其它服务器建立和使用网络连接。详见[底层传输配置](05_transport.md)

> `stats`: [StatsObject](stats.md)

当此项存在时，开启[统计信息](stats.md)。

> `reverse`: [ReverseObject](reverse.md)

[反向代理](reverse.md)配置。

## LogObject

```javascript
{
  "access": "文件地址",
  "error": "文件地址",
  "loglevel": "warning"
}
```

> `access`: string

访问日志的文件地址，其值是一个合法的文件地址，如`"/tmp/v2ray/_access.log"`（Linux）或者`"C:\\Temp\\v2ray\\_access.log"`（Windows）。当此项不指定或为空值时，表示将日志输出至 stdout。V2Ray 4.20 加入了特殊值`none`，即关闭access log。

> `error`: string

错误日志的文件地址，其值是一个合法的文件地址，如`"/tmp/v2ray/_error.log"`（Linux）或者`"C:\\Temp\\v2ray\\_error.log"`（Windows）。当此项不指定或为空值时，表示将日志输出至 stdout。V2Ray 4.20 加入了特殊值`none`，即关闭error log（跟`loglevel: "none"`等价）。

> `loglevel`: "debug" | "info" | "warning" | "error" | "none"

错误日志的级别。默认值为`"warning"`。

* `"debug"`: 只有开发人员能看懂的信息。同时包含所有`"info"`内容。
* `"info"`: V2Ray 在运行时的状态，不影响正常使用。同时包含所有`"warning"`内容。
* `"warning"`: V2Ray 遇到了一些问题，通常是外部问题，不影响 V2Ray 的正常运行，但有可能影响用户的体验。同时包含所有`"error"`内容。
* `"error"`: V2Ray 遇到了无法正常运行的问题，需要立即解决。
* `"none"`: 不记录任何内容。

## InboundObject

入站连接用于接收从客户端（浏览器或上一级代理服务器）发来的数据，可用的协议请见[协议列表](02_protocols.md)。

```javascript
{
  "port": 1080,
  "listen": "127.0.0.1",
  "protocol": "协议名称",
  "settings": {},
  "streamSettings": {},
  "tag": "标识",
  "sniffing": {
    "enabled": false,
    "destOverride": ["http", "tls"]
  },
  "allocate": {
    "strategy": "always",
    "refresh": 5,
    "concurrency": 3
  }
}
```

> `port`: number | "env:variable" | string

端口。接受的格式如下:

* 整型数值: 实际的端口号。
* 环境变量: 以`"env:"`开头，后面是一个环境变量的名称，如`"env:PORT"`。V2Ray 会以字符串形式解析这个环境变量。
* 字符串: 可以是一个数值类型的字符串，如`"1234"`；或者一个数值范围，如`"5-10"`表示端口 5 到端口 10 这 6 个端口。

当只有一个端口时，V2Ray 会在此端口监听入站连接。当指定了一个端口范围时，取决于`allocate`设置。

> `listen`: address

监听地址，只允许 IP 地址，默认值为`"0.0.0.0"`，表示接收所有网卡上的连接。除此之外，必须指定一个现有网卡的地址。

> `protocol`: string

连接协议名称，可选的值见[协议列表](02_protocols.md)。

> `settings`: InboundConfigurationObject

具体的配置内容，视协议不同而不同。详见每个协议中的`InboundConfigurationObject`。

> `streamSettings`: [StreamSettingsObject](05_transport.md#perproxy)。

[底层传输配置](05_transport.md#perproxy)

> `tag`: string

此入站连接的标识，用于在其它的配置中定位此连接。当其不为空时，其值必须在所有`tag`中唯一。

> `sniffing`: [SniffingObject](#sniffingobject)

尝试探测流量的类型

> `allocate`: [AllocateObject](#allocateobject)

端口分配设置

### SniffingObject

```javascript
{
  "enabled": false,
  "destOverride": ["http", "tls"]
}
```

> `enabled`: true | false

是否开启流量探测。

> `destOverride`: \["http" | "tls"\]

当流量为指定类型时，按其中包括的目标地址重置当前连接的目标。

### AllocateObject

```javascript
{
  "strategy": "always",
  "refresh": 5,
  "concurrency": 3
}
```

> `strategy`: "always" | "random"

端口分配策略。`"always"`表示总是分配所有已指定的端口，`port`中指定了多少个端口，V2Ray 就会监听这些端口。`"random"`表示随机开放端口，每隔`refresh`分钟在`port`范围中随机选取`concurrency`个端口来监听。

> `refresh`: number

随机端口刷新间隔，单位为分钟。最小值为`2`，建议值为`5`。这个属性仅当`strategy = random`时有效。

> `concurrency`: number

随机端口数量。最小值为`1`，最大值为`port`范围的三分之一。建议值为`3`。

## OutboundObject

出站连接用于向远程网站或下一级代理服务器发送数据，可用的协议请见[协议列表](02_protocols.md)。

```javascript
{
  "sendThrough": "0.0.0.0",
  "protocol": "协议名称",
  "settings": {},
  "tag": "标识",
  "streamSettings": {},
  "proxySettings": {
    "tag": "another-outbound-tag"
  },
  "mux": {}
}
```

> `sendThrough`: address

用于发送数据的 IP 地址，当主机有多个 IP 地址时有效，默认值为`"0.0.0.0"`。

> `protocol`: string

连接协议名称，可选的值见[协议列表](02_protocols.md)。

> `settings`: OutboundConfigurationObject

具体的配置内容，视协议不同而不同。详见每个协议中的`OutboundConfigurationObject`。

> `tag`: string

此出站连接的标识，用于在其它的配置中定位此连接。当其值不为空时，必须在所有 tag 中唯一。

> `streamSettings`: [StreamSettingsObject](05_transport.md#perproxy)。

[底层传输配置](05_transport.md#perproxy)

> `proxySettings`: [ProxySettingsObject](#proxysettingsobject)

出站代理配置。当出站代理生效时，此出站协议的`streamSettings`将不起作用。

> `mux`: [MuxObject](mux.md)

[Mux 配置](mux.md)。

### ProxySettingsObject

```javascript
{
  "tag": "another-outbound-tag"
}
```

> `tag`: string

当指定另一个出站协议的标识时，此出站协议发出的数据，将被转发至所指定的出站协议发出。
