# VMess

[![English](../resources/english.svg)](https://www.v2ray.com/en/configuration/protocols/vmess.html) [![Chinese](../resources/chinese.svg)](https://www.v2ray.com/chapter_02/protocols/vmess.html) [![German](../resources/german.svg)](https://www.v2ray.com/de/configuration/protocols/vmess.html) [![Russian](../resources/russian.svg)](https://www.v2ray.com/ru/configuration/protocols/vmess.html) [![Translate](../resources/lang.svg)](https://crowdin.com/project/v2ray)

[VMess](https://www.v2ray.com/eng/protocols/vmess.html) is a protocol for encrypted communications. It includes both inbound and outbound proxy.

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

* `vnext`: Массив, где каждая запись является удаленным сервером. 
  * ` address `: Адрес сервера, может быть IPv4, IPv6 или доменное имя.
  * `port`: Порт сервера.
  * `users`: Массив, в котором каждая запись является пользователем VMess. 
    * ` id `: Идентификатор пользователя в формате [ UUID ](https://en.wikipedia.org/wiki/Universally_unique_identifier).
    * ` alterId `: Число альтернативных идентификаторов. Альтернативные идентификаторы будут генерироваться детерминированным способом. Значение по умолчанию: 0. Максимальное значение: 65535. Рекомендуемое значение: 32.
    * ` userLevel `: Пользовательский уровень. See [Policy](../policy.md) for more detail.
    * `security`: Метод шифрования. Возможные варианты: 
      * `"aes-128-cfb"`
      * `"aes-128-gcm"`: Рекомендуется для ПК.
      * ` "chacha20-poly1305" `: Рекомендуется для мобильных устройств.
      * ` "auto" `: Значение по умолчанию. Используйте ` aes-128-gcm ` на AMD64 и S390x, или ` chacha20-poly1305 ` в противном случае.
      * ` "none" `: Не использовать шифрование.

## Конфигурация прокси для входящего соединения

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

* `clients`: Массив для действительных учетных записей пользователей. Может быть пустым при использовании функции динамического порта. 
  * Каждый клиент содержит: 
    * ` id `: Идентификатор пользователя в формате [ UUID ](https://en.wikipedia.org/wiki/Universally_unique_identifier).
    * ` userLevel `: Пользовательский уровень. См. [Локальная политика](../policy.md).
    * ` alterId `: Число альтернативных идентификаторов. То же, что и в конфигурации входящего соединения. Value must be the same as in client configuration.
    * `email`: Адрес электронной почты для идентификации пользователя.
* `detour`: Дополнительная функция, чтобы предложить клиенту использовать предложенный протокол. 
  * ` to `: Тег входящего прокси. See [Overview](../protocols.md). Если сконфигурировано, VMess предложит клиенту использовать предложенный протокол для дальнейших соединений.
* `default`: Необязательная конфигурация клиента по умолчанию. Обычно используется в предложенном прокси протоколе. 
  * ` userLevel `: Пользовательский уровень.
  * ` alterId `: Число альтернативных идентификаторов. Значение по умолчанию: 64.
* `disableInsecureEncryption`: Запретить клиенту использовать небезопасные методы шифрования. Если установлено значение true, соединения будут немедленно разорваны, если будут использоваться следующие методы шифрования. Значение по умолчанию: `false`. 
  * `none`
  * `aes-128-cfb`

## Советы

* Всегда используйте метод шифрования ` "auto" ` для обеспечения безопасности и совместимости.
* VMess зависит от системного времени. Убедитесь, что ваше системное время синхронизировано с временем UTC. Часовой пояс не имеет значения. 
  * Можно установить ` ntp ` службы на Linux для автоматической синхронизации системного времени.