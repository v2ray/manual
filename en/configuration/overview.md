# Configuration Overview

V2Ray shares a same structure of configuration between server side and client side shown as below. Server and client configurations are different in specific sections.

```javascript
{
  "log": {},
  "api": {},
  "dns": {},
  "routing": {},
  "policy": {},
  "inbound": {},
  "outbound": {},
  "inboundDetour": [],
  "outboundDetour": [],
  "transport": {}
}
```

Where:

* `log`: log configuration;
* `api`: API configuration;
* `dns`: DNS configuration;
* `routing`: routing configuration;
* `inbound`: master inbound interface configuration;
* `outbound`: master outbound interface configuration;
* `inboundDetour`: extra inbound interfaces configurations;
* `outboundDetour`: extra outbound interfaces configurations;
* `transport`: low-level transport protocol's configurations.

## Log configuration（log）

```javascript
{
  "access": "/path/to/file",
  "error": "/path/to/file",
  "loglevel": "warning"
}
```

Where:

* `access`: Path of access log, available examples are:
  * A legal path of file, such as `"/tmp/v2ray/_access.log"`(Linux), or `"C:\\Temp\\v2ray\\_access.log"`(Windows);
  * Leave it empty to discard logs, and content will send out through `stdout`.
* `error`: Path of error log, available examples are:
  * A legal path of file, such as `"/tmp/v2ray/_error.log"`(Linux), or `"C:\\Temp\\v2ray\\_error.log"`(Windows);
  * Leave it empty to discard logs, and content will send out through `stdout`.
* `loglevel`: Level of log files, available values are`"debug"`、`"info"`、`"warning"`、`"error"`, and`"none"`;
  * Among all of these levels, `"debug"` leaves the most log, `"error"` leaves the least log.
  * `"none"` would discard all error logs.
  * Default value is `"warning"` if you leave it empty.

## API Configuration

RPC API to control the V2Ray instance. See [API configuration](api.md) for details.

## DNS Configurations (dns)

Internal DNS server's configurations, if this section is omitted or empty, V2Ray will use your system-wide DNS configuration. For details, see [DNS Configurations](04_dns.md)

## Routing Configurations（routing）

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

Where:

* `strategy`: routing strategy, currently the only valid value is `"rules".
* `settings`: For specific configurations, see [Routing Configurations](03_routing.md)；

## Local Policy {#policy}

Configurations for permissions and other security strategies. For details, see [Local Policy](policy.md).

## Master Inbound Interface Configurations (inbound)

Master inbound interface is used to receive data from clients, browsers, or other parent proxy servers, available protocols are listed at [Protocols](02_protocols.md).

```javascript
{
  "port": 1080,
  "listen": "127.0.0.1",
  "protocol": "protocol_name",
  "settings": {},
  "streamSettings": {},
  "tag": "inbound_tag_name",
  "domainOverride": ["http", "tls"]
}
```

Where:

* `port`: listening port.
* `listen`: listening IP address, default value is `"0.0.0.0"`.
* `protocol`: protocol name, all available values are listed at [Protocols](02_protocols.md).
* `settings`: Protocol-specific settings, details are at protocols' detail pages.
* `streamSettings`: see [Protocol Transport Options](05_transport.md).
* `tag`: This inbound interface's tag, which should be unique among all inbound/outbound interfaces.
* `domainOverride`: recognize specific protocols' packets and redirects its request targets.
  * Accepts an array of strings, default value is empty.
  * Available values are `"http"` and `"tls"`.

## Master Outbound Interface Configurations (outbound)

Master outbound interface is used to send data to remote servers or next proxy server. Available protocols are listed at [Protocols](02_protocols.md).

```javascript
{
  "sendThrough": "0.0.0.0",
  "protocol": "protocol_name",
  "settings": {},
  "tag": "this_outbound_tag_name",
  "streamSettings": {},
  "proxySettings": {
    "tag": "another_outbound_tag_name"
  },
  "mux": {}
}
```

Where:

* `sendThrough`: The network interface (IP) to send data, available when multiple IPs shown, default value is `"0.0.0.0"`.
* `protocol`: protocol name, all available values are listed at [Protocols](02_protocols.md).
* `settings`: Protocol-specific settings, details are at protocols' detail pages.
* `tag`: This outbound interface's tag, which should be unique among all inbound/outbound interfaces.
* `streamSettings`: see [Protocol Transport Options](05_transport.md).
* `proxySettings`: Proxy for outbound connections. When this is set, `streamSettings` of this outbound will be omitted and disabled.
  * `tag`: When another outbound tag is specified, the data would be send via to the specified outbound.
* `mux`: [Mux Configurations](mux.md).

## Extra Inbound Interfaces Configurations (inbound detour)

This section is an array contains multiple extra inbound interfaces' configurations, each are using the structure like below:

```javascript
{
  "protocol": "protocol_name",
  "port": "port_number",
  "tag": "this_inbound_tag_name",
  "listen": "127.0.0.1",
  "allocate": {
    "strategy": "always",
    "refresh": 5,
    "concurrency": 3
  },
  "settings": {},
  "streamSettings": {},
  "domainOverride": ["http", "tls"]
}
```

Where:

* `protocol`: protocol name, all available values are listed at [Protocols](02_protocols.md).
* `port`: port number, could be a single number or range specified by a string, for example:`"5-10"` stands for port number 5 to 10.
* `tag`: This inbound interface's tag, which should be unique among all inbound/outbound interfaces.
* `listen`: listening IP address, default value is `"0.0.0.0"`.
* `allocate`: Allocation options:
  * `strategy`: Allocation strategies, available values are `"always"` and `"random"`. For `"always"` option, all ports will be listening specified by `"port"` settings; for `"random"`, every certain minutes would choose certain ports among the port ranges, configured by `"refresh"`, `"port"`, and `"concurrency"`.
  * `refresh`: The interval refreshing random ports, with unit of minutes. Minimum value is `2`, recommended value is `5`. This setting will only take effect when `strategy = random`.
  * `concurrency`: Number of random ports. Minimum value is `1`, maximum value is a half of ports' range. Recommended value is `3`.
* `settings`: Protocol-specific settings, details are at protocols' detail pages.
* `streamSettings`: see [Protocol Transport Options](05_transport.md).
* `domainOverride`: recognize specific protocols' packets and redirects its request targets.
  * Accepts an array of strings, default value is empty.
  * Available values are `"http"` and `"tls"`.

### Extra Outbound Interfaces Configurations (outbound detour)

This section is an array contains multiple extra outbound interfaces' configurations, each are using the structure like below:

```javascript
{
  "protocol": "protocol_name",
  "sendThrough": "0.0.0.0",
  "tag": "this_outbound_tag_name",
  "settings": {},
  "streamSettings": {},
  "proxySettings": {
    "tag": "another_outbound_tag_name"
  },
  "mux": {}
}
```

Where:

* `protocol`: protocol name, all available values are listed at [Protocols](02_protocols.md).
* `sendThrough`: The network interface (IP) to send data, available when multiple IPs shown, default value is `"0.0.0.0"`.
* `tag`: Outbound tag name of the current interface, data would be sent via this interface if this outbound is selected in routing configurations or other outbound's `proxySettings`.
* `settings`: Protocol-specific settings, details are at protocols' detail pages.
* `streamSettings`: For details, see [Protocol Transport Options](05_transport.md).
* `proxySettings`: Proxy for outbound connections. When this is set, `streamSettings` of this outbound will be omitted and disabled.
  * `tag`: When another outbound tag is specified, the data would be send via to the specified outbound.
* `mux`: [Mux Configurations](mux.md).

## Protocol Transport Options (transport)

Help configure how V2Ray would connect with other servers and how using network connections. For details, see [Protocol Transport Options](05_transport.md).
