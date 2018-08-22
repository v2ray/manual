# Статистика

[![Английский](../resources/english.svg)](https://www.v2ray.com/en/configuration/stats.html) [![Китайский](../resources/chinese.svg)](https://www.v2ray.com/chapter_02/stats.html) [![Немецкий](../resources/german.svg)](https://www.v2ray.com/de/configuration/stats.html) [![Русский](../resources/russian.svg)](https://www.v2ray.com/ru/configuration/stats.html)

V2Ray предоставляет информацию о своём состоянии.

Настройка:

```javascript
{
}
```

Все счетчики статистики перечислены ниже:

* `user>>>[email]>>>traffic>>>uplink` (V2Ray 3.16+): Накопленный исходящий трафик пользователя в байтах.
* `user>>>[email]>>>traffic>>>downlink` (V2Ray 3.16+): Накопленный входящий трафик пользователя в байтах.
* `inbound>>>[tag]>>>traffic>>>uplink` (V2Ray 3.18+): Накопленный исходящий трафик соединения в байтах.
* `inbound>>>[tag]>>>traffic>>>downlink` (V2Ray 3.18+): Накопленный входящий трафик соединения в байтах.

## Подсказки

* Если у пользователя нет валидного адреса электронной почты, статистика не будет накапливаться.