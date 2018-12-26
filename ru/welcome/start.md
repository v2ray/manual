---
refcn: chapter_00/start
refen: welcome/start
---
# Быстрый старт

Вам необходимо настроить V2Ray после его установки. Вот быстрая конфигурация для демонстрационного запуска. Детально настройки рассматриваются в [Обзоре настроек](../configuration/overview.md).

## Клиент {#client}

Запустите V2Ray со следующей конфигурацией на вашем ПК (или мобильном).

```javascript
{
  "inbounds": [{
    "port": 1080,  // Port of socks5 proxy. Настройте браузер на использование этого порта.
    "listen": "127.0.0.1",
    "protocol": "socks",
    "settings": {
      "udp": true
    }
  }],
  "outbounds": [{
    "protocol": "vmess",
    "settings": {
      "vnext": [{
        "address": "server", // Address of your V2Ray server. Может быть IP или доменным именем.
        "port": 10086,  // Порт сервера V2Ray.
        "users": [{ "id": "b831381d-6324-4d53-ad4f-8cda48b30811" }]
      }]
    }
  },{
    "protocol": "freedom",
    "tag": "direct",
    "settings": {}
  }],
  "routing": {
    "domainStrategy": "IPOnDemand",
    "rules": [{
      "type": "field",
      "ip": ["geoip:private"],
      "outboundTag": "direct"
    }]
  }
}
```

Измените IP-адрес своего сервера V2Ray, как указано выше в комментариях. После этого начнёт V2Ray проксировать весь трафик с вашего ПК на сервер V2Ray, за исключением внутрисетевого трафика.

## Сервер {#server}

Вам нужен еще один компьютер для запуска V2Ray в качестве сервера. Обычно этот компьютер находится за пределами файрвола (локального или глобального). Вот пример конфигурации.

```javascript
{
  "inbounds": [{
    "port": 10086, // Port of the server. Должен быть таким же, как упомянутый выше.
    "protocol": "vmess",
    "settings": {
      "clients": [{ "id": "b831381d-6324-4d53-ad4f-8cda48b30811" }]
    }
  }],
  "outbounds": [{
    "protocol": "freedom",
    "settings": {}
  }]
}
```

Убедитесь, что поле `id` одинаково на клиенте и сервере.

## Запуск {#running}

* В Windows и macOS файл конфигурации находится в том же каталоге, что и исполнимый файл V2Ray. Вы можете запустить `v2ray` или `v2ray.exe` без дополнительных параметров.
* На Linux файл конфигурации обычно находится в `/etc/v2ray/config.json`. Выполните `v2ray --config=/etc/v2ray/config.json` в консоли или используйте другие инструменты, типа systemd, для запуска V2Ray в качестве фонового процесса.

Детально настройки рассматриваются в [Обзоре настроек](../configuration/overview.md).