---
refcn: chapter_00/start
refen: welcome/start
---
# Быстрый старт

You need to configure V2Ray after installing it. Here is a quick configuration for a demo run. Please see [configuration overview](../configuration/overview.md) for more advanced setup.

## Клиент {#client}

Запустите V2Ray со следующей конфигурацией на вашем ПК (или мобильном).

```javascript
{
  "inbound": {
    "port": 1080,  // Порт для socks5-прокси. Настройте браузер на использование этого порта.
    "listen": "127.0.0.1",
    "protocol": "socks",
    "settings": {
      "udp": true
    }
  },
  "outbound": {
    "protocol": "vmess",
    "settings": {
      "vnext": [{
        "address": "server", // Адрес сервера V2Ray. Может быть IP или доменным именем.
        "port": 10086,  // Порт сервера V2Ray.
        "users": [{ "id": "b831381d-6324-4d53-ad4f-8cda48b30811" }]
      }]
    }
  },
  "outboundDetour": [{
    "protocol": "freedom",
    "tag": "direct",
    "settings": {}
  }],
  "routing": {
    "strategy": "rules",
    "settings": {
      "domainStrategy": "IPOnDemand",
      "rules": [{
        "type": "field",
        "ip": [
          "geoip:private"
        ],
        "outboundTag": "direct"
      }]
    }
  }
}
```

Please modify the IP address of your V2Ray server as mentioned above. After that, the V2Ray process on your PC will proxy all traffic to V2Ray server except intranet traffic.

## Сервер {#server}

You need another computer to run V2Ray as a server. Usually this computer is located outside firewall. Here is a sample configuration.

```javascript
{
  "inbound": {
    "port": 10086, // Port of the server. Должен быть таким же, как упомянутый выше.
    "protocol": "vmess",
    "settings": {
      "clients": [{ "id": "b831381d-6324-4d53-ad4f-8cda48b30811" }]
    }
  },
  "outbound": {
    "protocol": "freedom",
    "settings": {}
  }
}
```

Убедитесь, что поле `id` одинаково на клиенте и сервере.

## Запуск {#running}

* On Windows and macOS, configuration file is located in the same directory as V2Ray binary. You may run `v2ray` or `v2ray.exe` without additional parameters.
* На Linux файл конфигурации обычно находится в `/etc/v2ray/config.json`. Выполните `v2ray --config=/etc/v2ray/config.json` в консоли или используйте другие инструменты, типа systemd, для запуска V2Ray в качестве фонового процесса.

Детально настройки рассматриваются в [Обзоре настроек](../configuration/overview.md).