---
refcn: chapter_02/01_overview
refen: configuration/overview
---
# Обзор настроек

V2Ray имеет одинаковую структуру (см. ниже) файлов с настройками как на сервере, так и на клиенте. В отдельных секциях настройки сервера и клиента отличаются.

Ниже представлена ​​структура верхнего уровня конфигурации. Каждый раздел имеет свой собственный формат.

```javascript
{
  "log": {},
  "api": {},
  "dns": {},
  "stats": {},
  "routing": {},
  "policy": {},
  "inbound": {},
  "outbound": {},
  "inboundDetour": [],
  "outboundDetour": [],
  "transport": {}
}
```

Где:

* `log`: log configuration. See below for detail.
* `api`: RPC API to control the V2Ray instance. See [API configuration](api.md) for details.
* `dns`: Internal DNS server's configurations, if this section is omitted or empty, V2Ray will use your system-wide DNS configuration. For details, see [DNS Configurations](dns.md).
* `stats`: When specified, internal [Statistics](stats.md) is enabled.
* `policy`: Configurations for permissions and other security strategies. For details, see [Local Policy](policy.md).
* `routing`: [Routing configuration](routing.md).
* `inbound`: master inbound interface configuration.
* `outbound`: master outbound interface configuration.
* `inboundDetour`: extra inbound interfaces configurations.
* `outboundDetour`: extra outbound interfaces configurations.
* `transport`: low-level transport protocol's configurations. For details, see [Protocol Transport Options](transport.md).

## Конфигурация журнала {#log}

```javascript
{
  "access": "/path/to/file",
  "error": "/path/to/file",
  "loglevel": "warning"
}
```

Где:

* `access`: Path of access log, available examples are: 
  * A legal path of file, such as `"/tmp/v2ray/_access.log"`(Linux), or `"C:\\Temp\\v2ray\\_access.log"`(Windows);
  * Leave it empty to discard logs, and content will send out through `stdout`.
* `error`: Path of error log, available examples are: 
  * A legal path of file, such as `"/tmp/v2ray/_error.log"`(Linux), or `"C:\\Temp\\v2ray\\_error.log"`(Windows);
  * Leave it empty to discard logs, and content will send out through `stdout`.
* `loglevel`: Level of log files, available values are`"debug"`、`"информация"`、`"warning"`、`"error"`, and`"none"`; 
  * Among all of these levels, `"debug"` leaves the most log, `"error"` leaves the least log.
  * `"none"` would discard all error logs.
  * Default value is `"warning"` if you leave it empty.

Уровни журналирования:

* `debug`: Information for developers only.
* `info`: Information for current state of V2Ray. Users don't have to take care of those.
* `warning`: Something wrong with the environment, usually outside of V2Ray, e.g., network breakage. V2Ray still runs, but users may experience some breakages.
* `error`: Something severely wrong, that V2Ray can't run at all.

## Master Inbound Interface Configurations {#inbound}

Master inbound interface is used to receive data from clients, browsers, or other parent proxy servers, available protocols are listed at [Protocols](protocols.md).

```javascript
{
  "port": 1080,
  "listen": "127.0.0.1",
  "protocol": "protocol_name",
  "settings": {},
  "streamSettings": {},
  "tag": "inbound_tag_name",
  "domainOverride": ["http", "tls"],
  "sniffing": {
    "enabled": false,
    "destOverride": ["http", "tls"]
  }
}
```

Где:

* `port`: listening port.
* `port`: port to be listen from. Accepted formats are: 
  * Integer: actual port number.
  * Env variable (V2Ray 3.23+): Beginning with `"env:"`, an env variable specifies the port in string format, such as `"env:PORT"`. V2Ray will decode the variable as string.
  * String (V2Ray 3.23+): A numberic string value, such as `"1234"`.
* `listen`: listening IP address, default value is `"0.0.0.0"`.
* `protocol`: protocol name, all available values are listed at [Protocols](protocols.md).
* `settings`: Protocol-specific settings, details are at protocols' detail pages.
* `streamSettings`: see [Protocol Transport Options](transport.md).
* `tag`: This inbound interface's tag, which should be unique among all inbound/outbound interfaces.
* `domainOverride`: recognize specific protocols' packets and redirects its request targets. 
  * Accepts an array of strings, default value is empty.
  * Available values are `"http"` and `"tls"`.
  * (V2Ray 3.32+) Deprecated. Use `sniffing`. When `domainOverride` is set but `sniffing` is not set, V2Ray will enable `sniffing` anyway.
* `sniffing` (V2Ray 3.32+): Try to sniff current connection. 
  * `enabled`: Whether or not to enable sniffing.
  * `destOverride`: When current connection uses a protocol specified in the list, override its destination by sniff'ed destination. 
    * Available values are `"http"` and `"tls"`.

## Master Outbound Interface Configurations {#outbound}

Master outbound interface is used to send data to remote servers or next proxy server. Available protocols are listed at [Protocols](protocols.md).

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

Где:

* `sendThrough`: The network interface (IP) to send data, available when multiple IPs shown, default value is `"0.0.0.0"`.
* `protocol`: protocol name, all available values are listed at [Protocols](protocols.md).
* `settings`: Protocol-specific settings, details are at protocols' detail pages.
* `tag`: This outbound interface's tag, which should be unique among all inbound/outbound interfaces.
* `streamSettings`: see [Protocol Transport Options](transport.md).
* `proxySettings`: Proxy for outbound connections. When this is set, `streamSettings` of this outbound will be omitted and disabled. 
  * `tag`: When another outbound tag is specified, the data would be send via to the specified outbound.
* `mux`: [Mux Configurations](mux.md).

## Extra Inbound Interfaces Configurations {#inbound-detour}

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
  "domainOverride": ["http", "tls"],
  "sniffing": {
    "enabled": false,
    "destOverride": ["http", "tls"]
  }
}
```

Где:

* `protocol`: protocol name, all available values are listed at [Protocols](protocols.md).
* `port`: port to be listen from. Accepted formats are: 
  * Integer: actual port number.
  * Env variable: Beginning with `"env:"`, an env variable specifies the port in string format, such as `"env:PORT"`. V2Ray will decode the variable as string.
  * String: Either a numberic string value, such as `"1234"`, or a port range like `"5-10"` which stands for port number 5 to 10.
* `tag`: This inbound interface's tag, which should be unique among all inbound/outbound interfaces.
* `listen`: listening IP address, default value is `"0.0.0.0"`.
* `allocate`: Allocation options: 
  * `strategy`: Allocation strategies, available values are `"always"` and `"random"`. For `"always"` option, all ports will be listening specified by `"port"` settings; for `"random"`, every certain minutes would choose certain ports among the port ranges, configured by `"refresh"`, `"port"`, and `"concurrency"`.
  * `refresh`: The interval refreshing random ports, with unit of minutes. Minimum value is `2`, recommended value is `5`. This setting will only take effect when `strategy = random`.
  * `concurrency`: Number of random ports. Minimum value is `1`, maximum value is 1/3 of ports' range. Recommended value is `3`.
* `settings`: Protocol-specific settings, details are at protocols' detail pages.
* `streamSettings`: see [Protocol Transport Options](transport.md).
* `domainOverride`: recognize specific protocols' packets and redirects its request targets. 
  * Accepts an array of strings, default value is empty.
  * Available values are `"http"` and `"tls"`.
  * (V2Ray 3.32+) Deprecated. Use `sniffing`. When `domainOverride` is set but `sniffing` is not set, V2Ray will enable `sniffing` anyway.
* `sniffing` (V2Ray 3.32+): Try to sniff current connection. 
  * `enabled`: Whether or not to enable sniffing.
  * `destOverride`: When current connection uses a protocol specified in the list, override its destination by sniff'ed destination. 
    * Available values are `"http"` and `"tls"`.

### Extra Outbound Interfaces Configurations {#outbound-detour}

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

Где:

* `protocol`: protocol name, all available values are listed at [Protocols](protocols.md).
* `sendThrough`: The network interface (IP) to send data, available when multiple IPs shown, default value is `"0.0.0.0"`.
* `tag`: Outbound tag name of the current interface, data would be sent via this interface if this outbound is selected in routing configurations or other outbound's `proxySettings`.
* `settings`: Protocol-specific settings, details are at protocols' detail pages.
* `streamSettings`: For details, see [Protocol Transport Options](transport.md).
* `proxySettings`: Proxy for outbound connections. When this is set, `streamSettings` of this outbound will be omitted and disabled. 
  * `tag`: When another outbound tag is specified, the data would be send via to the specified outbound.
* `mux`: [Mux Configurations](mux.md).