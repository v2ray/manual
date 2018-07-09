# Быстрый старт

[![English](../resources/english.svg)](https://www.v2ray.com/en/welcome/start.html) [![Chinese](../resources/chinese.svg)](https://www.v2ray.com/chapter_00/start.html) [![German](../resources/german.svg)](https://www.v2ray.com/de/welcome/start.html) [![Russian](../resources/russian.svg)](https://www.v2ray.com/ru/welcome/start.html) [![Translate](../resources/lang.svg)](https://crowdin.com/project/v2ray)

Вам необходимо настроить V2Ray после его установки. Вот быстрая конфигурация для демонстрационного запуска. Детально настройки рассматриваются в [Обзоре конфигурации](../configuration/overview.md).

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

## Server {#server}

You need another computer to run V2Ray as a server. Usually this computer is located outside firewall. Here is a sample configuration.

```javascript
{
  "inbound": {
    "port": 10086, // Port of the server. Must be the same as above.
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

Please make sure the `id` field is the same between client and server.

## Running {#running}

* On Windows and macOS, configuration file is located in the same directory as V2Ray binary. You may run `v2ray` or `v2ray.exe` without additional parameters.
* On Linux, configuration file is usually located at `/etc/v2ray/config.json`. Run `v2ray --config=/etc/v2ray/config.json` in foreground or use other tools such as systemd to run V2Ray as background process.

See [Overview](../configuration/overview.md) for more detail of the configuration.