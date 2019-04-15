---
refcn: chapter_00/start
refen: welcome/start
---

# 新手上路

在下载并安装了V2Ray之后，你需要对它做一下配置才能使用。V2Ray即可作为服务端，也可作为客户端，这取决于你的配置。这里介绍一下简单的配置方式，只是为了让你能够尽快尝试V2Ray。如需配置更复杂的功能，请参考[配置文件说明](../chapter_02/01_overview.md)。

* 在 Windows 和 macOS 中，配置文件通常是V2Ray同目录下的 `config.json` ；
* 在 Linux 中，配置文件通常路径为 `/etc/v2ray/config.json`  。

用文本编辑器打开配置文件，然后按照下面示例完成修改即可。

## 服务端 {#server}

首先你需要一台墙外的服务器，来运行服务器端的V2Ray。V2Ray客户端的请求会由服务端转发，配置如下：

```javascript
{
  "inbounds": [{
    "port": 10086, // 10086为V2Ray服务器端口，需要与V2Ray客户端中outbounds.settings.vnext.port一致
    "protocol": "vmess",
    "settings": {
      //  id需要与V2Ray客户端中outbounds.settings.vnext.users的id一致
      "clients": [{ "id": "b831381d-6324-4d53-ad4f-8cda48b30811" }]
    }
  }],
  "outbounds": [{
    "protocol": "freedom",
    "settings": {}
  }]
}
```

`10086`端口记得开放访问权限！

## 客户端 {#client}

然后你得在墙内的某台电脑（一般是自己电脑）上安装V2Ray客户端，需要翻墙的软件需要将网络代理配置成此客户端。网络请求在客户端中加密后才发送到服务端，配置如下：

```javascript
{
  "inbounds": [{
    "port": 1080,  // SOCKS 代理端口，配置代理时需设为这个端口
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
        "address": "V2Ray服务端地址", // 请修改为你自己的V2Ray服务器ip或域名
        "port": 10086,  // 10086为V2Ray服务端的端口，需要与V2Ray服务端中inbounds.port一致
        //  需要与V2Ray服务端中inbounds.settings.clients的id一致
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

上述配置中需要修改**V2Ray服务端地址**，注意确认有**//**说明的项。

## 运行

* 在 Windows 和 macOS 中，直接运行 `v2ray` 或 `v2ray.exe` 即可。
* 在 Linux 中，运行 `v2ray --config=/etc/v2ray/config.json`，或使用 systemd 等工具把 V2Ray 作为服务在后台运行。

更多详见的说明可以参考[白话文教程](https://toutyrater.github.io/)和[配置文件说明](../chapter_02/01_overview.md)。
