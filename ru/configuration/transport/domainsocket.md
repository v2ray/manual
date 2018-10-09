---
refcn: chapter_02/transport/domainsocket
refen: configuration/transport/domainsocket
---
# Доставка через сокет домена

Сокет домена использует стандартный сокет домена Unix для доставки данных. Сокет домена - это внутрисистемный канал передачи данных. Он не создаёт задержек в сетевом буфере и может быть немного быстрее, чем передача через локальную петлю (loopback).

Domain socket can only be used on platforms that supports Unix domain socket, such as macOS and Linux. It is not available on Windows.

Configuration:

```javascript
{
  "path": "/path/to/ds/file"
}
```

Where:

* `path`: An valid absolute file path. Before running V2Ray, the file on this path must not exist.

## Tips {#tips}

* When domain socket is used, IP and port specified on the inbound/outbound proxy will be ignored. All traffic is tunneled through the domain socket.