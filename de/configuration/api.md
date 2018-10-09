---
refcn: chapter_02/api
refen: configuration/api
---
# API

V2Ray provides some API for remote access. These APIs are based on [gRPC](https://grpc.io/).

When API is enabled, V2Ray creates an outbound proxy automatically, tagged as `tag`. User must [route](routing.md) all gRPC connections to this outbound.

Aufbau:

```javascript
{
  "tag": "api",
  "services": [
    "HandlerService",
    "LoggerService",
    "StatsService"
  ]
}
```

Woher:

* `Tag`: Das Tag des Outbound-Proxys.
* `Dienste`: Liste der aktivierten APIs.

## Unterstützte API-Liste

### HandlerService

API for manipulating inbound and outbound proxies. The following functionalities are provided:

* Fügen Sie einen neuen eingehenden / ausgehenden Proxy hinzu.
* Entfernen Sie einen vorhandenen eingehenden / ausgehenden Proxy.
* Fügen Sie einem eingehenden Proxy einen neuen Benutzer hinzu (nur VMess).
* Entfernen Sie einen vorhandenen Benutzer von einem eingehenden Proxy (nur VMess).

### LoggerService

To restart internal logger. Can work with logrotate for operating log files.

### Statistikdienst

Unterstützung für interne [Statistiken](stats.md).