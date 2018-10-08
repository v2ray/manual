# Quick Start

[![English][1]][2] [![Chinese][3]][4] [![German][5]][6] [![Russian][7]][8]

[1]: ../resources/english.svg
[2]: https://www.v2ray.com/en/welcome/start.html
[3]: ../resources/chinese.svg
[4]: https://www.v2ray.com/chapter_00/start.html
[5]: ../resources/german.svg
[6]: https://www.v2ray.com/de/welcome/start.html
[7]: ../resources/russian.svg
[8]: https://www.v2ray.com/ru/welcome/start.html

You need to configure V2Ray after installing it. Here is a quick configuration for a demo run. Please see [configuration overview](../configuration/overview.md) for more advanced setup.

## Client {#client}

On your PC (or mobile), run V2Ray with the following configuration.

```javascript
{
  "inbound": {
    "port": 1080,  // Port of socks5 proxy. Point your browser to use this port.
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
        "address": "server", // Address of your V2Ray server. May be IP or domain address.
        "port": 10086,  // Port of your V2Ray server.
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
* On Linux, configuration file is usually located at  `/etc/v2ray/config.json`. Run `v2ray --config=/etc/v2ray/config.json` in foreground or use other tools such as systemd to run V2Ray as background process.

See [Overview](../configuration/overview.md) for more detail of the configuration.
