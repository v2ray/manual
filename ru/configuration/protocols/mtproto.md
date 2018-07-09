# MTProto

[![English](../../resources/english.svg)](https://www.v2ray.com/en/configuration/protocols/mtproto.html) [![Chinese](../../resources/chinese.svg)](https://www.v2ray.com/chapter_02/protocols/mtproto.html) [![German](../../resources/german.svg)](https://www.v2ray.com/de/configuration/protocols/mtproto.html) [![Russian](../../resources/russian.svg)](https://www.v2ray.com/ru/configuration/protocols/mtproto.html)

MTProto proxy is a special procol for Telegram. It consists of a pair of inbound and outboud proxies in V2Ray. They are usually used together for building a proxy for Telegram

**For now V2Ray only supports IPv4 address of Telegram server.**

Protocol description:

* Название: mtproto
* Тип: входящий / исходящий

## Конфигурация входящего соединения {#inbound}

```javascript
{
  "users": [{
    "email": "love@v2ray.com",
    "level": 0,
    "secret": "b0cbcef5a486d9636472ac27f8e11a9d"
  }]
}
```

Where:

* `users`: Массив пользователей. **На данный момент поддерживается только первый пользователь**. Каждый пользователь имеет следующую конфигурацию: 
  * `email`: Электронная почта пользователя. Используется для сбора статистики. См. [ Статистика ](../stats.md).
  * ` userLevel `: Пользовательский уровень.
  * `secret`: Секрет пользователя. В Telegram секрет пользователя должен быть длиной 32 символа и содержать только символы ` 0 ` — ` 9 `, и ` a ` — ` f `.

## Конфигурация исходящего соединения {#outbound}

```javascript
{
}
```

## Пример {#sample}

MTProto can only be used for Telegram traffic. You may need a routing rule to combine the corresponding inbound and outbound. Here is an incomplete sample.

Inbound:

```javascript
{
  "tag": "tg-in",
  "port": 443,
  "protocol": "mtproto",
  "settings": {
    "users": [{"secret": "b0cbcef5a486d9636472ac27f8e11a9d"}]
  }
}
```

Outbound:

```javascript
{
  "tag": "tg-out",
  "protocol": "mtproto",
  "settings": {}
}
```

Routing:

```javascript
{
  "type": "field",
  "inboundTag": ["tg-in"],
  "outboundTag": "tg-out"
}
```

The configure your Telegram app to connect to 443 port on this machine.

## Советы {#tips}

* Используйте эту команду для генерации секрета MTProto: ` openssl rand -hex 16 `.