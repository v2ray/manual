# 反向代理

反向代理是一个 V2Ray 的附加功能，可以把服务器端的流量向客户端转发，即逆向流量转发。

{% hint style='tip' %}
反向代理功能在 V2Ray 4.0+ 可用。目前处于测试阶段，可能会有一些问题。
{% endhint %}

反向代理的大致工作原理如下:

* 假设在主机 A 中有一个网页服务器，这台主机没有公网 IP，无法在公网上直接访问。另有一台主机 B，它可以由公网访问。现在我们需要把 B 作为主口，把流量从 B 转发到 A。
* 在主机 A 中配置一个 V2Ray，称为`bridge`，在 B 中也配置一个 V2Ray，称为`portal`。
* `bridge`会向`portal`主动建立连接。在连接建立之后，`portal`可以将流量由这些连接反向发送给`bridge`。
* `bridge`会根据流量的大小进行动态的负载均衡。

## 配置

```javascript
{
  "bridges": [{
    "tag": "bridge",
    "domain": "test.v2ray.com"
  }],
  "portals": [{
    "tag": "bridge",
    "domain": "test.v2ray.com"
  }]
}
```

其中:

* `bridges`: 一个数组，每一项表示一个`bridge`。每个`bridge`的配置如下:
  * `tag`: 一个标识，所有由`bridge`发出的连接，都会带有这个标识。可以在[路由](03_routing.md)中使用`inboundTag`进行识别。
  * `domain`: `bridge`向`portal`建立的连接，都会使用这个域名进行发送。这个域名只作为`bridge`和`portal`的通信用途，不必真实存在。
* `portals`: 一个数组，每一项表示一个`portal`。每个`portal`的配置如下:
  * `tag`: `portal`的标识。在[路由](03_routing.md)中使用`outboundTag`将流量转发到这个`portal`。
  * `domain`: 一个域名。当`portal`接收到流量时，如果流量的目标域名是此域名，则`portal`认为当前连接上`bridge`发来的通信连接。而其它流量则会被当成需要转发的流量。`portal`所做的工作就是把这两类连接进行识别并拼接。

{% hint style='tip' %}
和其它配置一样，一个 V2Ray 既可以作为`bridge`，也可以作为`portal`，也可以同时两者，以适用于不同的场景需要。
{% endhint %}

{% hint style='danger' %}
反向代理默认已开启 [Mux](mux.md)，请不要在其用到的传出代理上再次开启 Mux。
{% endhint %}

## 样例配置

`bridge`通常需要两个传出代理，一个用于连接`portal`，另一个用于发送实际的流量。也就是说，你需要用路由区分两种流量。

反向代理配置:

```javascript
{
  "bridges": [{
    "tag": "bridge",
    "domain": "test.v2ray.com"
  }]
}
```

传出代理:

```javascript
{
  "tag": "out"
  "protocol": "freedom",
  "settings": {
    "redirect": "127.0.0.1:80" // 将所有流量转发到网页服务器
  }
},
{
  "protocol": "vmess",
  "settings": {
    "vnext": [{
      "address": "portal的IP地址",
      "port": 1024,
      "users": [{"id": "27848739-7e62-4138-9fd3-098a63964b6b"}]
    }]
  },
  "tag": "interconn"
}
```

路由配置:

```javascript
"routing": {
  "strategy": "rules",
  "settings": {
    "rules": [{
      "type": "field",
      "inboundTag": ["bridge"],
      "domain": ["full:test.v2ray.com"],
      "outboundTag": "interconn"
    },{
      "type": "field",
      "inboundTag": ["bridge"],
      "outboundTag": "out"
    }]
  }
}
```

`portal`通常需要两个传入代理，一个用于接收`bridge`的连接，另一个用于接收实际的流量。同时你也需要用路由区分两种流量。

反向代理配置:

```javascript
{
  "portals": [{
    "tag": "portal",
    "domain": "test.v2ray.com"  // 必须和 bridge 的配置一样
  }]
}
```

传入代理:

```javascript
{
  "tag": "external",
  "port": 80,  // 开放 80 端口，用于接收外部的 HTTP 访问
  "protocol": "dokodemo-door",
  "settings": {
    "address": "127.0.0.1",
    "port": 80,
    "network": "tcp"
  }
},
{
  "port": 1024, // 用于接收 bridge 的连接
  "tag": "interconn",
  "protocol": "vmess",
  "settings": {
    "clients": [{"id": "27848739-7e62-4138-9fd3-098a63964b6b"}]
  }
}
```

路由配置:

```javascript
"routing": {
  "strategy": "rules",
  "settings": {
    "rules": [{
      "type": "field",
      "inboundTag": ["external"],
      "outboundTag": "portal"
    },{
      "type": "field",
      "inboundTag": ["interconn"],
      "outboundTag": "portal"
    }]
  }
}
```

{% hint style='tip' %}
在运行过程中，建议先启用`bridge`，再启用`portal`。
{% endhint %}
