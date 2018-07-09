# API

[![English](../resources/english.svg)](https://www.v2ray.com/en/configuration/api.html) [![Chinese](../resources/chinese.svg)](https://www.v2ray.com/chapter_02/api.html) [![German](../resources/german.svg)](https://www.v2ray.com/de/configuration/api.html) [![Russian](../resources/russian.svg)](https://www.v2ray.com/ru/configuration/api.html)

V2Ray bietet eine API für den Remotezugriff. Diese APIs basieren auf [GRPC](https://grpc.io/).

Wenn die API aktiviert ist, erstellt V2Ray automatisch einen ausgehenden Proxy, der als `Tag`. Benutzer must [Route](routing.md) alle gRPC Verbindungen zu diesem Outbound.

Aufbau:

```javascript
{"tag": "api", "Dienste": ["HandlerService", "LoggerService", "StatsService"]}
```

Woher:

* `Tag`: Das Tag des Outbound-Proxys.
* `Dienste`: Liste der aktivierten APIs.

## Unterstützte API-Liste

### HandlerService

API zum Manipulieren von eingehenden und ausgehenden Proxies. Folgende Funktionalitäten stehen zur Verfügung:

* Fügen Sie einen neuen eingehenden / ausgehenden Proxy hinzu.
* Entfernen Sie einen vorhandenen eingehenden / ausgehenden Proxy.
* Fügen Sie einem eingehenden Proxy einen neuen Benutzer hinzu (nur VMess).
* Entfernen Sie einen vorhandenen Benutzer von einem eingehenden Proxy (nur VMess).

### LoggerService

Um den internen Logger neu zu starten. Kann mit logrotate arbeiten, um Protokolldateien zu betreiben.

### Statistikdienst

Unterstützung für interne [Statistiken](stats.md).