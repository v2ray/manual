# Dokodemo-door

![English](../../resources/englishc.svg) [![Chinese](../../resources/chinese.svg)](https://www.v2ray.com/chapter_02/protocols/dokodemo.html)

Dokodemo-door - это протокол для входящих соединений. Он принимает любые соединения и передает их в указанное место назначения.

Dokodemo-door также может работать (если настроен) как прозрачный transparent proxy.

* Имя: dokodemo-door
* Тип: входящий
* Конфигурация:

```javascript
{
  "address": "8.8.8.8",
  "port": 53,
  "network": "tcp",
  "followRedirect": false,
  "userLevel": 0
}
```

Где:

* `address`: Адрес определенного сервера. Может быть IPv4, IPv6 или доменом в форме 'string'. 
  * когда ` followRedirect ` (см. ниже) ` true `, `address` может быть пустым.
* `port`: Порт определённого сервера. Выражается формой 'Integer'.
* `network`: Тип сети: "tcp" или "udp".
* `followRedirect`: Если установлено значение ` true `, dokodemo-door распознает назначение от TProxy и использует его в качестве адресата. 
  * Работает только на Linux
  * Поддержка соединений TCP / IPv4
  * Поддерживает пакеты UDP / IPv4. Требуется права root (CAP \ _NET \ _ADMIN)
* `userLevel`: User level. All connections share this level. See [Policy](../policy.md) for details.

## Examples for transparent proxy

Add a dokodemo-door inbound as below.

```javascript
{
  "network": "tcp,udp",
  "timeout": 30,
  "followRedirect": true
}
```

Configure iptables as below.

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