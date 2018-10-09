---
refcn: chapter_02/protocols/vmess
refen: configuration/protocols/vmess
---
# VMess

[VMess](https://www.v2ray.com/eng/protocols/vmess.html) is a protocol for encrypted communications. It includes both inbound and outbound proxy.

* Наименование: vmess
* Type: Inbound / Outbound

## Outbound Proxy Configuration

```javascript
{
  "vnext": [
    {
      "address": "127.0.0.1",
      "port": 37192,
      "users": [
        {
          "id": "27848739-7e62-4138-9fd3-098a63964b6b",
          "alterId": 16,
          "security": "auto",
          "level": 0
        }
      ]
    }
  ]
}
```

Where:

* `vnext`: Массив, где каждая запись является удаленным сервером. 
  * ` address `: Адрес сервера, может быть IPv4, IPv6 или доменное имя.
  * `port`: Server port
  * `users`: Массив, в котором каждая запись является пользователем VMess. 
    * ` id `: Идентификатор пользователя в формате [ UUID ](https://en.wikipedia.org/wiki/Universally_unique_identifier).
    * ` alterId `: Число альтернативных идентификаторов. Альтернативные идентификаторы будут генерироваться детерминированным способом. Значение по умолчанию: 0. Максимальное значение: 65535. Рекомендуемое значение: 16. Оно не должно быть больше, чем alterId входящего соединения.
    * `level`: User level. See [Policy](../policy.md) for more detail.
    * `security`: Encryption method. Options are: 
      * `"aes-128-gcm"`: Рекомендуется для ПК.
      * `"chacha20-poly1305"`: Рекомендуется для мобильных устройств.
      * `"auto"`: Default value. Use `aes-128-gcm` on AMD64, ARM64 and S390x, or `chacha20-poly1305` otherwise.
      * `"none"`: Не использовать шифрование.

## Inbound Proxy Configuration

```javascript
{
  "clients": [
    {
      "id": "27848739-7e62-4138-9fd3-098a63964b6b",
      "level": 0,
      "alterId": 100,
      "email": "love@v2ray.com"
    }
  ],
  "default": {
    "level": 0,
    "alterId": 32
  },
  "detour": {
    "to": "tag_to_detour"
  },
  "disableInsecureEncryption": false
}
```

Where:

* `clients`: An array for valid user accounts. May be empty when used for dynamic port feature. 
  * Каждый клиент содержит: 
    * ` id `: Идентификатор пользователя в формате [ UUID ](https://en.wikipedia.org/wiki/Universally_unique_identifier).
    * `level`: User level. See [Policy](../policy.md) for its usage.
    * `alterId`: Number of alternative IDs. Same as in Outbound.
    * `email`: Адрес электронной почты для идентификации пользователя.
* `detour`: Дополнительная функция, чтобы предложить клиенту использовать предложенный протокол. 
  * `to`: The tag of an inbound proxy. See [Overview](../protocols.md). If configured, VMess will suggest its client to use the detour for further connections.
* `default`: Optional default client configuration. Usually used in detour proxy. 
  * `level`: User level.
  * `alterId`: Number of alternative IDs. Default value 64. Recommend 16.
* `disableInsecureEncryption`: Forbids client for using insecure encryption methods. When set to true, connections will be terminated immediately if the following encryption is used. Default value `false`. 
  * `none`
  * `aes-128-cfb`

## Tips

* Всегда используйте метод шифрования ` "auto" ` для обеспечения безопасности и совместимости.
* VMess depends on system time. Please ensure that your system time is in sync with UTC time. Timezone doesn't matter. 
  * Можно установить ` ntp ` службы на Linux для автоматической синхронизации системного времени.
* You may choose the value of `alterId` at your interest. For daily usage, a value less than `100` is usually enough.