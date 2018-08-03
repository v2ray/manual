# Локальная политика

[![Английский](../resources/english.svg)](https://www.v2ray.com/en/configuration/policy.html) [![Китайский](../resources/chinese.svg)](https://www.v2ray.com/chapter_02/policy.html) [![Немецкий](../resources/german.svg)](https://www.v2ray.com/de/configuration/policy.html) [![Русский](../resources/russian.svg)](https://www.v2ray.com/ru/configuration/policy.html)

Локальная политика была добавлена в V2Ray 3.1.

Локальная политика управляет параметрами V2Ray, например временем ожидания подключения. Политики могут применяться к отдельному уровню доступа пользователей или для всей системы.

Конфигурация:

```javascript
{
  "levels": {
    "0": {
      "handshake": 4,
      "connIdle": 300,
      "uplinkOnly": 2,
      "downlinkOnly": 5,
      "statsUserUplink": false,
      "statsUserDownlink": false
    }
  },
  "system": {
    "statsInboundUplink": false,
    "statsInboundDownlink": false
  }
}
```

Где:

* `level`: Ассоциативный массив, пары ключ-значение. Each key is a string of integer (restricted by JSON), such as `"0"`, `"1"`, etc. The numeric value is for a certain user level. Each value has the following attributes: 
  * `handshake`: Timeout for establishing a connection, in seconds. Default value `4`.
  * `connIdle`: Timeout for idle connections, in seconds. Default value `300`.
  * `uplinkOnly`: Time for keeping connections open after the uplink of the connection is closed, in seconds. Default value `2`.
  * `downlinkOnly`: Time for keeping connections open after the downlink of the connection is closed, in seconds. Default value `5`.
  * `statsUserUplink`: When set to `true`, V2Ray enables stat counter to uplink traffic for all users in this level.
  * `statsUserDownlink`: When set to `true`, V2Ray enables stat counter to downlink traffic for all users in this level.
  * `bufferSize` (V2Ray 3.24+): Size of internal buffer per connection, in kilo-bytes. Default value is `10240`. When it is set to `0`, the internal buffer is disabled.
* `system` (V2Ray 3.18+): System policy for V2Ray 
  * `statsInboundUplink` (V2Ray 3.18+): When set to `true`, V2Ray enables stat counter for all uplink traffic in all inbound proxies.
  * `statsInboundDownlink` (V2Ray 3.18+): When set to `true`, V2Ray enables stat counter for all downlink traffic in all inbound proxies.

Some details when V2Ray handles connections:

1. At the handshake stage of an inbound proxy dealing with a new connection, say VMess reading request header, if it takes longer than `handshake` time, V2Ray aborts the connection.
2. If there is no data passed through the connection in `connIdle` time, V2Ray aborts the conneciton.
3. After client (browser) closes the uplink of the connection, V2Ray aborts the connection after `downlinkOnly` time.
4. After remote (server) closes the downlink of the connection, V2Ray aborts the connection after `uplinkOnly` times.

## Tips {#tips}

* Each inbound and outbound connection can apply a user level. V2Ray applies corresponding policy based on user level.
* `bufferSize` overrides `v2ray.ray.buffer.size` settings in [env variables](env.md#cache-size-per-connection).