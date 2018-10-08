* * *

refcn: chapter_02/api refen: configuration/api

* * *

# API

V2Ray provides some API for remote access. These APIs are based on [gRPC](https://grpc.io/).

When API is enabled, V2Ray creates an outbound proxy automatically, tagged as `tag`. User must [route](routing.md) all gRPC connections to this outbound.

Configuration:

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

Where:

* `tag`: The tag of the outbound proxy.
* `services`: List of enabled APIs.

## Supported API list

### HandlerService

API for manipulating inbound and outbound proxies. The following functionalities are provided:

* Add a new inbound/outbound proxy.
* Remove an existing inbound/outbound proxy.
* Add a new user to an inbound proxy (VMess only).
* Remove an existing user from an inbound proxy (VMess only).

### LoggerService

To restart internal logger. Can work with logrotate for operating log files.

### StatsService

Support for internal [Statistics](stats.md).