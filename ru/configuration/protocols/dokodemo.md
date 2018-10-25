* * *

refcn: chapter_02/protocols/dokodemo refen: configuration/protocols/dokodemo

* * *

# Dokodemo-door

Dokodemo-door - это протокол для входящих соединений. Он принимает любые соединения и передает их в указанное место назначения.

Dokodemo-door также может работать (если настроен) как transparent proxy.

* Название: dokodemo-door
* Тип: входящий
* Конфигурация:

```javascript
{
  "address": "8.8.8.8",
  "port": 53,
  "network": "tcp",
  "followRedirect": false,
  "userLevel": 0
}
```

Где:

* `address`: Адрес определенного сервера. Строка, значением которой может быть IPv4, IPv6 или доменное имя. 
  * если `followRedirect` (см. ниже) `true`, `address` может быть пустым.
* `port`: Порт сервера назначения. Целое число.
* `network`: Тип сети: "tcp" или "udp".
* `followRedirect`: Если установлено значение `true`, dokodemo-door распознает точку назначения TProxy и будет использовать её. См. `TProxy` в [Настройках доставки](../transport.md) для деталей.
* ` userLevel `: Пользовательский уровень. Все подключения проходят через этот уровень. Подробности: [Правила](../policy.md).

## Примеры для transparent proxy

Добавьте inbound-соединение dokodemo-door, как показано ниже.

```javascript
{
  "network": "tcp,udp",
  "timeout": 30,
  "followRedirect": true
}
```

Настройте iptables, как показано ниже.

```bash
# Создаём новую цепь
iptables -t nat -N V2RAY
iptables -t mangle -N V2RAY
iptables -t mangle -N V2RAY_MARK

# Игнорируем адреса серверов V2Ray
# Это ОЧЕНЬ ВАЖНО, будьте внимательны.
iptables -t nat -A V2RAY -d 123.123.123.123 -j RETURN

# Игнорируем адреса локальной сети и любые другие адреса,
# которые не требуется пропускать через прокси-сервер
# См. Википедию и RFC5735 для полного списка зарезервированных сетей.
iptables -t nat -A V2RAY -d 0.0.0.0/8 -j RETURN
iptables -t nat -A V2RAY -d 10.0.0.0/8 -j RETURN
iptables -t nat -A V2RAY -d 127.0.0.0/8 -j RETURN
iptables -t nat -A V2RAY -d 169.254.0.0/16 -j RETURN
iptables -t nat -A V2RAY -d 172.16.0.0/12 -j RETURN
iptables -t nat -A V2RAY -d 192.168.0.0/16 -j RETURN
iptables -t nat -A V2RAY -d 224.0.0.0/4 -j RETURN
iptables -t nat -A V2RAY -d 240.0.0.0/4 -j RETURN

# Всё остальное перенаправляем на локальный порт Dokodemo-door
iptables -t nat -A V2RAY -p tcp -j REDIRECT --to-ports 12345

# Добавляем правила для UDP
ip route add local default dev lo table 100
ip rule add fwmark 1 lookup 100
iptables -t mangle -A V2RAY -p udp --dport 53 -j TPROXY --on-port 12345 --tproxy-mark 0x01/0x01
iptables -t mangle -A V2RAY_MARK -p udp --dport 53 -j MARK --set-mark 1

# Применяем правила
iptables -t nat -A OUTPUT -p tcp -j V2RAY
iptables -t mangle -A PREROUTING -j V2RAY
iptables -t mangle -A OUTPUT -j V2RAY_MARK
```