# Статистика

[![English](../resources/english.svg)](https://www.v2ray.com/en/configuration/stats.html) [![Chinese](../resources/chinese.svg)](https://www.v2ray.com/chapter_02/stats.html) [![German](../resources/german.svg)](https://www.v2ray.com/de/configuration/stats.html) [![Russian](../resources/russian.svg)](https://www.v2ray.com/ru/configuration/stats.html)

V2Ray предоставляет информацию о своём состоянии.

Настройка:

```javascript
{
}
```

Все счетчики статистики перечислены ниже:

* `user>>>[email]>>>traffic>>>uplink` (V2Ray 3.16+): Accumulated uplink traffic of specific user, in bytes.
* `user>>>[email]>>>traffic>>>downlink` (V2Ray 3.16+): Accumulated downlink traffic of specific user, in bytes.
* `inbound>>>[tag]>>>traffic>>>uplink` (V2Ray 3.18+): Accumulated uplink traffic of specific inbound, in bytes.
* `inbound>>>[tag]>>>traffic>>>downlink` (V2Ray 3.18+): Accumulated downlink traffic of specific inbound, in bytes.

## Подсказки

* Если у пользователя нет действительного адреса электронной почты, статистика не будет включена.