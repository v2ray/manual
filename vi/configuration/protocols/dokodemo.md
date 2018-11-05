* * *

refcn: chapter_02/protocols/dokodemo refen: configuration/protocols/dokodemo

* * *

# Dokodemo-door

* Name: dokodemo-door
* Type: Inbound

Dokodemo-door is a protocol for inbound connections. It take any connections and passes them to the specified destination.

Dokodemo-door can also (if configured) work as a transparent proxy.

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