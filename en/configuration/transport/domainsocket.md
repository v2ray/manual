# Domain Socket Transport

[![English][1]][2] [![German][3]][4] [![Russian][5]][6]

[1]: ../../resources/english.svg
[2]: https://www.v2ray.com/en/configuration/transport/domainsocket.html
[3]: ../../resources/german.svg
[4]: https://www.v2ray.com/de/configuration/transport/domainsocket.html
[5]: ../../resources/russian.svg
[6]: https://www.v2ray.com/ru/configuration/transport/domainsocket.html

Domain Socket uses standard Unix domain socket to transport data. Domain socket is system interal tranfer channel. It doesn't jam network buffer and may be a bit faster than trasnferring through local loopback network.

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
