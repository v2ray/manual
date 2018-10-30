---
refcn: chapter_02/protocols/dokodemo
refen: configuration/protocols/dokodemo
---

# Dokodemo-door

* 名称: dokodemo-door
* 类型: 入站协议

Dokodemo door（任意门）是一个入站数据协议，它可以监听一个本地端口，并把所有进入此端口的数据发送至指定服务器的一个端口，从而达到端口映射的效果。

## 示例配置

```javascript
{
  "address": "8.8.8.8",
  "port": 53,
  "network": "tcp",
  "timeout": 0,
  "followRedirect": false,
  "userLevel": 0
}
```

> **address**: IP 地址 | 域名

将流量转发到此地址。可以是一个 IP 地址，形如`"1.2.3.4"`，或者一个域名，形如`"v2ray.com"`。字符串类型。

当 `followRedirect`（见下文）为 `true` 时，`address` 可为空。

> **port**: 端口

将流量转发到目标地址的指定端口，范围\[1, 65535\]，数值类型。必填参数。

> **network**: "tcp" | "udp" | "tcp,udp"

可接收的网络协议类型。比如当指定为`"tcp"`时，任意门仅会接收 TCP 流量。默认值为`"tcp"`。

> **timeout**: 300

入站数据的时间限制（秒），默认值为 300。

V2Ray 3.1 后等价于对应用户等级的 `connIdle` 策略

> **followRedirect**: true | false

当值为`true`时，dokodemo-door 会识别出由 iptables 转发而来的数据，并转发到相应的目标地址。详见[传输配置](../05_transport.md)中的`tproxy`设置。

> **userLevel**: 0

用户等级，所有连接都会使用这个用户等级。

## 透明代理配置样例 {#example}

V2Ray 中增加一个 dokodemo-door 的入站协议：

```javascript
{
  "network": "tcp,udp",
  "timeout": 30,
  "followRedirect": true
}
```

配置 iptables：

```bash
# Create new chain
iptables -t nat -N V2RAY
iptables -t mangle -N V2RAY
iptables -t mangle -N V2RAY_MARK

# Ignore your V2Ray server's addresses
# It's very IMPORTANT, just be careful.
iptables -t nat -A V2RAY -d 123.123.123.123 -j RETURN

# Ignore LANs and any other addresses you'd like to bypass the proxy
# See Wikipedia and RFC5735 for full list of reserved networks.
iptables -t nat -A V2RAY -d 0.0.0.0/8 -j RETURN
iptables -t nat -A V2RAY -d 10.0.0.0/8 -j RETURN
iptables -t nat -A V2RAY -d 127.0.0.0/8 -j RETURN
iptables -t nat -A V2RAY -d 169.254.0.0/16 -j RETURN
iptables -t nat -A V2RAY -d 172.16.0.0/12 -j RETURN
iptables -t nat -A V2RAY -d 192.168.0.0/16 -j RETURN
iptables -t nat -A V2RAY -d 224.0.0.0/4 -j RETURN
iptables -t nat -A V2RAY -d 240.0.0.0/4 -j RETURN

# Anything else should be redirected to Dokodemo-door's local port
iptables -t nat -A V2RAY -p tcp -j REDIRECT --to-ports 12345

# Add any UDP rules
ip route add local default dev lo table 100
ip rule add fwmark 1 lookup 100
iptables -t mangle -A V2RAY -p udp --dport 53 -j TPROXY --on-port 12345 --tproxy-mark 0x01/0x01
iptables -t mangle -A V2RAY_MARK -p udp --dport 53 -j MARK --set-mark 1

# Apply the rules
iptables -t nat -A OUTPUT -p tcp -j V2RAY
iptables -t mangle -A PREROUTING -j V2RAY
iptables -t mangle -A OUTPUT -j V2RAY_MARK
```
