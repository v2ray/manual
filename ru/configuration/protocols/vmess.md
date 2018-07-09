# VMess

[VMess](https://www.v2ray.com/eng/protocols/vmess.html) это протокол для шифрованной передачи информации. Он включает в себя входящий и исходящий прокси.

* Наименование: vmess
* Тип: входящий / исходящий

## Конфигурация прокси для исходящего соединения

```javascript
{
  "vnext": [
    {
      "address": "127.0.0.1",
      "port": 37192,
      "users": [
        {
          "id": "27848739-7e62-4138-9fd3-098a63964b6b",
          "alterId": 10,
          "security": "aes-128-cfb",
          "level": 0
        }
      ]
    }
  ]
}
```

Где:

* `vnext`: Массив, где каждая запись является удаленным сервером 
  * ` address `: Адрес сервера, может быть IPv4, IPv6 или доменное имя
  * `port`: Порт сервера
  * `users`: Массив, в котором каждая запись является пользователем VMess 
    * ` id ` : Идентификатор пользователя в формате [ UUID ](https://en.wikipedia.org/wiki/Universally_unique_identifier)
    * ` alterId `: Число альтернативных идентификаторов. Альтернативные идентификаторы будут генерироваться детерминированным способом. Значение по умолчанию: 0. Максимальное значение: 65535. Рекомендуемое значение: 32.
    * ` userLevel `: Пользовательский уровень. См. [локальная политика](../Policy.md).
    * `security`: Метод шифрования. Возможные варианты: 
      * `"aes-128-cfb"`
      * `"aes-128-gcm"`: Рекомендуется для ПК.
      * ` "chacha20-poly1305" `: Рекомендуется для мобильных устройств.
      * ` "auto" `: Значение по умолчанию. Use `aes-128-gcm` on AMD64 and S390x, or `chacha20-poly1305` otherwise.
      * `"none"`: Traffic is not encrypted at all.

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
  * Each client contains: 
    * `id`: User ID, in the form of [UUID](https://en.wikipedia.org/wiki/Universally_unique_identifier).
    * `level`: User level. See [Policy](../policy.md) for its usage.
    * `alterId`: Number of alternative IDs. Same as in Inbound. Value must be the same as connecting clients.
    * `email`: Email address to identify users.
* `detour`: Optional feature to suggest client to take a detour. 
  * `to`: The tag of an inbound proxy. See [Overview](../02_protocols.md). If configured, VMess will suggest its client to use the detour for further connections.
* `default`: Optional default client configuration. Usually used in detour proxy. 
  * `level`: User level.
  * `alterId`: Number of alternative IDs. Default value 64.
* `disableInsecureEncryption`: Forbids client for using insecure encryption methods. When set to true, connections will be terminated immediately if the following encryption is used. Default value `false`. 
  * `none`
  * `aes-128-cfb`

## Tips

* Always use encryption method `"auto"` to stay secure and compatible.
* VMess depends on system time. Please ensure that your system time is in sync with UTC time. Timezone doesn't matter. 
  * One may install `ntp` service on Linux to automatically adjust system time.