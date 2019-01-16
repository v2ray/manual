---
refcn: chapter_02/protocols/vmess
refen: configuration/protocols/vmess
---
# VMess

* Название: `vmess`
* Тип: входящий / исходящий

[VMess](https://www.v2ray.com/eng/protocols/vmess.html) это протокол для шифрованной передачи информации. Он включает в себя входящий и исходящий прокси.

VMess зависит от системного времени. Убедитесь, что ваше системное время синхронизировано с временем UTC. Часовой пояс не имеет значения. Можно установить ` ntp ` службы на Linux для автоматической синхронизации системного времени.

## OutboundConfigurationObject

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

> `vnext`: \[ [ServerObject](#serverobject) \]

An array, where each element presents a remote server

### ServerObject

```javascript
{
  "address": "127.0.0.1",
  "port": 37192,
  "users": []
}
```

> `address`: address

Server address, may be IPv4, IPv6 or domain name.

> `port`: number

Server port

> `users`: \[ [UserObject](#userobject) \]

An array where each element is an VMess user

### UserObject

```javascript
{
  "id": "27848739-7e62-4138-9fd3-098a63964b6b",
  "alterId": 16,
  "security": "auto",
  "level": 0
}
```

> `id`: string

Идентификатор пользователя в формате [UUID](https://en.wikipedia.org/wiki/Universally_unique_identifier).

> `alterId`: number

Number of alternative IDs. The alternative IDs will be generated in a deterministic way. Default to 0. Maximum 65535. Recommend 16. Its value must be not larger than the one in corresponding Inbound.

> `level`: number

User level. See [Policy](../policy.md) for more detail.

> `security`: "aes-128-gcm" | "chacha20-poly1305" | "auto" | "none"

Method for encrypting payload. This setting is only available at outbound. The VMess inbound will automatically recognize this setting and decrypt payload accordingly. Options are:

* `"aes-128-gcm"`: Рекомендуется для ПК.
* `"chacha20-poly1305"`: Рекомендуется для мобильных устройств.
* `"auto"`: Значение по умолчанию. Используйте `aes-128-gcm` на AMD64, ARM64 и S390x, или `chacha20-poly1305` в остальных случаях.
* ` "none" `: Не использовать шифрование.

{% hint style='info' %}

Используйте `"auto"` где это возможно, для лучшей совместимости.

{% endhint %}

## InboundConfigurationObject

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

> `clients`: \[ [ClientObject](#clientobject) \]

Массив для действительных учетных записей пользователей. Может быть пустым при использовании функции динамического порта.

> `detour`: [DetourObject](#detourobject)

Optional feature to suggest client to take a detour. If specified, this inbound will instruct the outbound to use another inbound.

> `default`: [DefaultObject](#defaultobject)

Optional default client configuration. Usually used with `detour`.

> `disableInsecureEncryption`: true | false

Запретить клиенту использовать небезопасные методы шифрования. Если установлено значение `true`, соединения будут немедленно разорваны, если будут использоваться следующие методы шифрования. Значение по умолчанию: `false`.

* `none`
* `aes-128-cfb`

### ClientObject

```javascript
{
  "id": "27848739-7e62-4138-9fd3-098a63964b6b",
  "level": 0,
  "alterId": 16,
  "email": "love@v2ray.com"
}
```

> `id`: string

Идентификатор пользователя в формате [UUID](https://ru.wikipedia.org/wiki/UUID).

> `level`: number

User level. See [Policy](../policy.md) for its usage.

> `alterId`: number

Число альтернативных идентификаторов. То же, что и в Исходящем соединении (см выше).

> `email`: string

Email address for user identification.

### DetourObject

```javascript
{
  "to": "tag_to_detour"
}
```

> `to`: string

The tag of an inbound proxy. See [Overview](../protocols.md). If configured, VMess will suggest its client to use the detour for further connections.

### DefaultObject

```javascript
{
  "level": 0,
  "alterId": 32
}
```

> `level`: number

Уровень пользователя.

> `alterId`: number

Число альтернативных идентификаторов. По умолчанию: 64. Рекомендуемое значение: 16.