# WebSocket

[![English](../../resources/english.svg)](https://www.v2ray.com/en/configuration/transport/websocket.html) [![Chinese](../../resources/chinese.svg)](https://www.v2ray.com/chapter_02/transport/websocket.html) [![German](../../resources/german.svg)](https://www.v2ray.com/de/configuration/transport/websocket.html) [![Russian](../../resources/russian.svg)](https://www.v2ray.com/ru/configuration/transport/websocket.html)

Используйте стандартный WebSocket для передачи данных. Соединения Websocket могут быть проксифицированы HTTP-сервером, таким как Nginx.

Конфигурация:

```javascript
{
  "path": "",
  "headers": {
    "Host": "v2ray.com"
  }
}
```

Где:

* `path`: Путь, используемый для WebSocket. По умолчанию корень домена `""`.
* `headers`: Пользовательский HTTP-заголовок. An array where each entry is a key value pair in string, for header and value in HTTP header. Default is empty.

## Notice

* Since V2Ray 3.4, Websocket recognizes X-Forwarded-For header and use it as source address of the traffic.