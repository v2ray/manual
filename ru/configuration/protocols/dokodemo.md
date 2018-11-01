* * *

refcn: chapter_02/protocols/dokodemo refen: configuration/protocols/dokodemo

* * *

# Dokodemo-door

* Название: dokodemo-door
* Тип: входящий

Dokodemo-door - это протокол для входящих соединений. Он принимает любые соединения и передает их в указанное место назначения.

Dokodemo-door также может работать (если настроен) как transparent proxy.

## ConfigurationObject

```javascript
{
  "address": "8.8.8.8",
  "port": 53,
  "network": "tcp",
  "followRedirect": false,
  "userLevel": 0
}
```

> `address`: address

Address of the destination server. May be an IPv4, IPv6 or a domain, in string form. When `followRedirect` (see below) is `true`, `address` can be empty.

> `port`: number

Port of the destination server.

> `network`: "tcp" | "udp" | "tcp,udp"

Type of acceptable network. If `"tcp"` is specified, all UDP traffic sent to this dokodemo-door will be discarded.

> `followRedirect`: true | false

When set to `true`, dokodemo-door will recognize destination from TProxy and use it as its destination. See `TProxy` in [transport](../transport.md) for detail.

> `userLevel`: number

User level. All connections share this level. See [Policy](../policy.md) for details.

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

```bash
# Создаём новую цепь
iptables -t nat -N V2RAY
iptables -t mangle -N V2RAY
iptables -t mangle -N V2RAY_MARK

# Игнорируем адреса серверов V2Ray
# Это ОЧЕНЬ ВАЖНО, будьте внимательны.
iptables -t nat -A V2RAY -d 123.123.123.123 -j RETURN

# Игнорируем адреса локальной сети и любые другие адреса,
# которые не требуется пропускать через прокси-сервер
# См. Википедию и RFC5735 для полного списка зарезервированных сетей.
iptables -t nat -A V2RAY -d 0.0.0.0/8 -j RETURN
iptables -t nat -A V2RAY -d 10.0.0.0/8 -j RETURN
iptables -t nat -A V2RAY -d 127.0.0.0/8 -j RETURN
iptables -t nat -A V2RAY -d 169.254.0.0/16 -j RETURN
iptables -t nat -A V2RAY -d 172.16.0.0/12 -j RETURN
iptables -t nat -A V2RAY -d 192.168.0.0/16 -j RETURN
iptables -t nat -A V2RAY -d 224.0.0.0/4 -j RETURN
iptables -t nat -A V2RAY -d 240.0.0.0/4 -j RETURN

# Всё остальное перенаправляем на локальный порт Dokodemo-door
iptables -t nat -A V2RAY -p tcp -j REDIRECT --to-ports 12345

# Добавляем правила для UDP
ip route add local default dev lo table 100
ip rule add fwmark 1 lookup 100
iptables -t mangle -A V2RAY -p udp --dport 53 -j TPROXY --on-port 12345 --tproxy-mark 0x01/0x01
iptables -t mangle -A V2RAY_MARK -p udp --dport 53 -j MARK --set-mark 1

# Применяем правила
iptables -t nat -A OUTPUT -p tcp -j V2RAY
iptables -t mangle -A PREROUTING -j V2RAY
iptables -t mangle -A OUTPUT -j V2RAY_MARK
```