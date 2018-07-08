# Dokodemo-door

![English](../../resources/englishc.svg) [![Chinese](../../resources/chinese.svg)](https://www.v2ray.com/chapter_02/protocols/dokodemo.html)

Dokodemo-door - это протокол для входящих соединений. Он принимает любые соединения и передает их в указанное место назначения.

Dokodemo-door также может работать (если настроен) как прозрачный transparent proxy.

* Имя: dokodemo-door
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
* `followRedirect`: Если установлено значение ` true `, dokodemo-door распознает назначение от TProxy и использует его в качестве адресата. 
  * Работает только на Linux
  * Поддержка соединений TCP / IPv4
  * Поддержка UDP/IPv4-пакетов. Требуются права суперпользователя (CAP\ _NET\ _ADMIN)
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

```plain
# Создать новую цепь
root@Wrt:~# iptables -t nat -N V2RAY
root@Wrt:~# iptables -t mangle -N V2RAY
root@Wrt:~# iptables -t mangle -N V2RAY_MARK

# Игнорировать адрес V2Ray сервера
# Очень важно не ошибиться здесь.
root @ Wrt: ~ # iptables -t nat -A V2RAY -d 123.123.123.123 -j RETURN 
# Игнорировать адреса локальной сети и любые другие адреса, которые не требуется пропускать через прокси-сервер 
# См. Википедию и RFC5735 для полного списка зарезервированных сетей.
root@Wrt:~# iptables -t nat -A V2RAY -d 0.0.0.0/8 -j RETURN
root@Wrt:~# iptables -t nat -A V2RAY -d 10.0.0.0/8 -j RETURN
root@Wrt:~# iptables -t nat -A V2RAY -d 127.0.0.0/8 -j RETURN
root@Wrt:~# iptables -t nat -A V2RAY -d 169.254.0.0/16 -j RETURN
root@Wrt:~# iptables -t nat -A V2RAY -d 172.16.0.0/12 -j RETURN
root@Wrt:~# iptables -t nat -A V2RAY -d 192.168.0.0/16 -j RETURN
root@Wrt:~# iptables -t nat -A V2RAY -d 224.0.0.0/4 -j RETURN
root@Wrt:~# iptables -t nat -A V2RAY -d 240.0.0.0/4 -j RETURN

# Перенаправить на локальный порт Dokodemo-door
root@Wrt:~# iptables -t nat -A V2RAY -p tcp -j REDIRECT --to-ports 12345

# Добавить правила для UDP
root@Wrt:~# ip route add local default dev lo table 100
root@Wrt:~# ip rule add fwmark 1 lookup 100
root@Wrt:~# iptables -t mangle -A V2RAY -p udp --dport 53 -j TPROXY --on-port 12345 --tproxy-mark 0x01/0x01
root@Wrt:~# iptables -t mangle -A V2RAY_MARK -p udp --dport 53 -j MARK --set-mark 1

# Применить правила
root@Wrt:~# iptables -t nat -A OUTPUT -p tcp -j V2RAY
root@Wrt:~# iptables -t mangle -A PREROUTING -j V2RAY
root@Wrt:~# iptables -t mangle -A OUTPUT -j V2RAY_MARK
```