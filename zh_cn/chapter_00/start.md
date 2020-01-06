---
refcn: chapter_00/start
refen: welcome/start
---

# 新手上路

在下载并安装了 V2Ray 之后，你需要对它进行一下配置。这里介绍一下简单的配置方式，只是为了演示，如需配置更复杂的功能，请参考后续的[配置文件说明](../chapter_02/01_overview.md)。

## 客户端 {#client}

在你的 PC （或手机）中，你需要运行 V2Ray 并使用下面的配置：

```javascript
{
  "inbounds": [{
    "port": 1080,  // SOCKS 代理端口，在浏览器中需配置代理并指向这个端口
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
        "address": "server", // 服务器地址，请修改为你自己的服务器 ip 或域名
        "port": 10086,  // 服务器端口
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

上述配置唯一要改的地方就是你的服务器 IP，配置中已注明。上述配置会把除了局域网（比如访问路由器）之外的所有流量转发到你的服务器。

## 服务器 {#server}

然后你需要一台防火墙外的服务器，来运行服务器端的 V2Ray。配置如下：

```javascript
{
  "inbounds": [{
    "port": 10086, // 服务器监听端口，必须和上面的一样
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

服务器的配置中需要确保 `id` 和端口与客户端一致，就可以正常连接了。

## 运行

* 在 Windows 和 macOS 中，配置文件通常是 V2Ray 同目录下的 `config.json` 文件。直接运行 `v2ray` 或 `v2ray.exe` 即可。
* 在 Linux 中，配置文件通常位于 `/etc/v2ray/config.json` 文件。运行 `v2ray --config=/etc/v2ray/config.json`，或使用 systemd 等工具把 V2Ray 作为服务在后台运行。

更多详见的说明可以参考[白话文教程](https://guide.v2fly.org/)和[配置文件说明](../chapter_02/01_overview.md)。
