---
refcn: chapter_02/protocols/mtproto
refen: configuration/protocols/mtproto
---
# MTProto

* Название: `mtproto`
* Тип: входящий / исходящий

MTProto proxy - специальный прокол для Telegram. Он состоит из пары входящих и исходящих прокси в V2Ray. Они обычно используются вместе для создания прокси для Telegram.

На данный момент V2Ray поддерживает только IPv4 адрес сервера Telegram.

## InboundConfigurationObject

```javascript
{
  "users": [{
    "email": "love@v2ray.com",
    "level": 0,
    "secret": "b0cbcef5a486d9636472ac27f8e11a9d"
  }]
}
```

> `users`: \[[UserObject](#userobject)\]

Массив пользователей. Пока обрабатывается только первый пользователь.

### UserObject

```javascript
{
  "email": "love@v2ray.com",
  "level": 0,
  "secret": "b0cbcef5a486d9636472ac27f8e11a9d"
}
```

> `email`: string

Электронная почта пользователя. Используется для сбора статистики. См. [Статистика](../stats.md).

> `level`: number

Уровень пользователя.

> `secret`: string

Секрет пользователя. В Telegram секрет пользователя должен быть длиной 32 символа и содержать только символы от `0` до `9`, и от `a` до `f`.

{% hint style='tip' %}

Используйте для генерации секрета MTProto эту команду: `openssl rand -hex 16`

{% endhint %}

## Конфигурация исходящего соединения {#outbound}

```javascript
{
}
```

## Пример {#sample}

MTProto может использоваться только для трафика Telegram. Для объединения соответствующего входящего и исходящего может потребоваться правило маршрутизации. Вот неполный образец.

Входящее соединение:

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

Исходящее соединение:

```javascript
{
  "tag": "tg-out",
  "protocol": "mtproto",
  "settings": {}
}
```

Маршрутизация:

```javascript
{
  "type": "field",
  "inboundTag": ["tg-in"],
  "outboundTag": "tg-out"
}
```

Настройте приложение Telegram для подключения к 443 порту на этом устройстве.