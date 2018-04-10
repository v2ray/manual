# Dokodemo-door

![Chinese](../../resources/chinesec.svg) [![English](../../resources/english.svg)](https://www.v2ray.com/en/configuration/protocols/dokodemo.html)

Dokodemo door（任意门）是一个传入数据协议，它可以监听一个本地端口，并把所有进入此端口的数据发送至指定服务器的一个端口，从而达到端口映射的效果。

* 名称：dokodemo-door
* 类型：Inbound
* 配置：

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

其中：

* `address`: 指定服务器的地址，可以是一个 IPv4、IPv6 或者域名，字符串类型。
  * 当 `followRedirect`（见下文）为 `true` 时，`address` 可为空。
* `port`: 指定服务器的端口，数值类型。
* `network`: 指定服务器的网络协议类型，可选值为“tcp”或“udp”。
* `timeout` (V2Ray 3.1 后等价于对应用户等级的 `connIdle` 策略): 传入数据的时间限制（秒），默认值为 300。
* `followRedirect`: 当值为 `true` 时，dokodemo-door 会识别出由 iptables 转发而来的数据，并转发到相应的目标地址。
  * 目前只支持 Linux。
  * 支持 TCP/IPv4 连接。
  * 支持 UDP/IPv4 连接，需要 root (CAP\_NET\_ADMIN) 权限。
* `userLevel`: 用户等级，所有连接都会使用这个用户等级。

## 透明代理配置样例 {#example}

V2Ray 中增加一个 dokodemo-door 的传入协议：

```javascript
{
  "network": "tcp,udp",
  "timeout": 30,
  "followRedirect": true
}
```

配置 iptables：

```plain
# Create new chain
root@Wrt:~# iptables -t nat -N V2RAY
root@Wrt:~# iptables -t mangle -N V2RAY
root@Wrt:~# iptables -t mangle -N V2RAY_MARK

# Ignore your V2Ray server's addresses
# It's very IMPORTANT, just be careful.
root@Wrt:~# iptables -t nat -A V2RAY -d 123.123.123.123 -j RETURN

# Ignore LANs and any other addresses you'd like to bypass the proxy
# See Wikipedia and RFC5735 for full list of reserved networks.
root@Wrt:~# iptables -t nat -A V2RAY -d 0.0.0.0/8 -j RETURN
root@Wrt:~# iptables -t nat -A V2RAY -d 10.0.0.0/8 -j RETURN
root@Wrt:~# iptables -t nat -A V2RAY -d 127.0.0.0/8 -j RETURN
root@Wrt:~# iptables -t nat -A V2RAY -d 169.254.0.0/16 -j RETURN
root@Wrt:~# iptables -t nat -A V2RAY -d 172.16.0.0/12 -j RETURN
root@Wrt:~# iptables -t nat -A V2RAY -d 192.168.0.0/16 -j RETURN
root@Wrt:~# iptables -t nat -A V2RAY -d 224.0.0.0/4 -j RETURN
root@Wrt:~# iptables -t nat -A V2RAY -d 240.0.0.0/4 -j RETURN

# Anything else should be redirected to Dokodemo-door's local port
root@Wrt:~# iptables -t nat -A V2RAY -p tcp -j REDIRECT --to-ports 12345

# Add any UDP rules
root@Wrt:~# ip route add local default dev lo table 100
root@Wrt:~# ip rule add fwmark 1 lookup 100
root@Wrt:~# iptables -t mangle -A V2RAY -p udp --dport 53 -j TPROXY --on-port 12345 --tproxy-mark 0x01/0x01
root@Wrt:~# iptables -t mangle -A V2RAY_MARK -p udp --dport 53 -j MARK --set-mark 1

# Apply the rules
root@Wrt:~# iptables -t nat -A OUTPUT -p tcp -j V2RAY
root@Wrt:~# iptables -t mangle -A PREROUTING -j V2RAY
root@Wrt:~# iptables -t mangle -A OUTPUT -j V2RAY_MARK
```
