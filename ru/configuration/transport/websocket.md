---
refcn: chapter_02/transport/websocket
refen: configuration/transport/websocket
---

# WebSocket

Использует стандартный WebSocket для передачи данных. Соединения Websocket могут быть проксифицированы HTTP-сервером, например Nginx.

## WebSocketObject

`WebSocketObject` используется как `wsSettings` в `TransportObject` и `StreamSettingsObject`.

{% hint style='info' %}

Websocket распознает HTTP-заголовок X-Forwarded-For и использует его в качестве адреса входящего источника.

{% endhint %}

```javascript
{
  "path": "/",
  "headers": {
    "Host": "v2ray.com"
  }
}
```

> `path`: string

Путь, используемый для WebSocket. По умолчанию корень домена `"/"`.

> `headers`: map{string, string}

Пользовательский HTTP-заголовок. Это массив, в котором каждая запись представляет собой пару ключевых значений в строке, для заголовка и значения в заголовке HTTP. По умолчанию пуст.