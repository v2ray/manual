---
refcn: chapter_02/stats
refen: configuration/stats
---

# Статистика

V2Ray предоставляет информацию о своём состоянии.

## StatsObject

`StatsObject` используется как поле `stats` на верхнем уровне конфигурации.

```javascript
{
}
```

На данный момент в настройках статистики нет параметров. Статистика включается автоматически, когда `StatsObject` установлен в конфигурации верхнего уровня. Вам также необходимо включить соответствующие настройки в [Policy](policy.md), чтобы отслеживать статистику пользователя или системы.

Все счетчики статистики перечислены ниже:

## Пользовательский трафик

Если у пользователя не указан адрес электронной почты в настройках протокола, статистика трафика не будет включена.

> `user>>>[email]>>>traffic>>>uplink`

Accumulated uplink traffic of specific user, in bytes.

> `user>>>[email]>>>traffic>>>downlink`

Accumulated downlink traffic of specific user, in bytes.

## Глобальный трафик

> `inbound>>>[tag]>>>traffic>>>uplink`

Accumulated uplink traffic of specific inbound, in bytes.

> `inbound>>>[tag]>>>traffic>>>downlink`

Accumulated downlink traffic of specific inbound, in bytes.