# Dokodemo-door

Dokodemo door is a protocol for inbound connections. It take any connections and passes them to the specified destination.

Dokodemo door can also (if configured) work as a transparent proxy.

* Name: dokodemo-door
* Type: Inbound
* Configuration:

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

Where:

* `address`: Address of the destination server. May be an IPv4, IPv6 or a domain, in string form.
  * when `followRedirect` (see below) is `true`, `address` can be empty.
* `port`: Port of the destination server. Integer.
* `network`: Type of network, either "tcp" or "udp".
* `timeout` (Deprecated, equivalent to `connIdle` in Policy): Timeout for idle connection in seconds. Default value 300.
* `followRedirect`: When set to `true`, dokodemo-door will recognize destination from TProxy and use it as its destination.
  * Only works on Linux
  * Supports TCP/IPv4 connections
  * Supports UDP/IPv4 packets. Requires root (CAP\_NET\_ADMIN) permission
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
