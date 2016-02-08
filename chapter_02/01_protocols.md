# V2Ray 协议列表

本小节包含下列协议：
* [Blackhole](#blackhole)
* [Dokodemo-door](#dokodemo-door)
* [Freedom](#freedom)
* [HTTP](#http)
* [Shadowsocks](#shadowsocks)
* [Socks](#socks)
* [VMess](#vmess)

## Blackhole
Blackhole（黑洞）是一个传出数据协议，它会阻碍所有数据的传出，配合[[路由（Routing）|路由配置]]一起使用，可以达到禁止访问某些网站的效果。

* 名称：blackhole
* 类型：Outbound
* 配置：空


## Dokodemo-door
Dokodemo door（任意门）是一个传入数据协议，它可以监听一个本地端口，并把所有进入此端口的数据发送至指定服务器的一个端口，从而达到端口映射的效果。

* 名称：dokodemo-door
* 类型：Inbound
* 配置：
```javascript
{
  "address": "8.8.8.8",
  "port": 53,
  "network": "tcp",
  "timeout": 0
}
```
其中：
* address：指定服务器的地址，可以是一个 IPv4、IPv6 或者域名，字符串类型。
* port：指定服务器的端口，数值类型。
* network：指定服务器的网络协议类型，目前仅支持 TCP。
* timeout：传入数据的时间限制（秒），0 表示无限制。

## Freedom
Freedom 是一个传出数据协议，可以用来向任意网络发送（正常的） TCP 或 UDP 数据。

* 名称：freedom
* 类型：Outbound
* 配置：空

## HTTP
HTTP 是一个传入数据协议，兼容 HTTP 1.x 代理。

* 名称：http
* 类型：Inbound
* 配置：空

## Shadowsocks
[Shadowsocks](https://zh.wikipedia.org/wiki/Shadowsocks) 协议，与原版 Shadowsocks 兼容性：
* 支持 TCP 和 UDP 数据包转发，UDP 可选择性关闭；
* 支持 [OTA](https://shadowsocks.org/en/spec/one-time-auth.html)；
* 加密方式：aes-256-cfb / aes-128-cfb；

此协议是一个传入协议，只适用于服务器端。客户端版本请使用 Shadowsocks [官方推荐](https://shadowsocks.org/en/download/clients.html)的工具。

* 名称：shadowsocks
* 版本：V2Ray 1.6+
* 类型：Inbound
* 配置：
```javascript
{
  "method": "加密方式",
  "password": "密码",
  "udp": false,
  "level": 0
}
```

其中：
* method: 加密方式，可选的值有"aes-256-cfb"和"aes-128-cfb"，没有默认值。
* password: 密码，任意字符串。Shadowsocks 协议并不限制密码长度，但短密码会更可能被破解，建议使用 16 字符或更长的密码。
* udp: true / false，是否开启 UDP 转发，默认值为 false。
* level (V2Ray 1.7+): 用户等级，默认值为 0。如果是自用的 VPS，可以设成 1。详见 VMess 中的 level 选项。

## Socks
Socks 是一个传入数据协议，兼容 [Socks 4](http://ftp.icm.edu.pl/packages/socks/socks4/SOCKS4.protocol) 和 [Socks 5](http://ftp.icm.edu.pl/packages/socks/socks4/SOCKS4.protocol)，暂不支持 Socks 4a。

* 名称：socks
* 类型：Inbound
* 配置：
```javascript
{
  "auth": "noauth",
  "accounts": [  // 当 auth 为 "password" 时有效
    {"user": "my-username", "pass", "my-password"}
  ],
  "udp": false,
  "ip": "127.0.0.1",
  "timeout": 0
}
```
其中：
* auth: Socks 协议的认证方式，支持"noauth"匿名方式和"password"用户密码方式。默认值为"noauth"。
* acounts: 一个数组，数组中每个元素为一个用户帐号，用户名由"user"指定，密码由"pass"指定。默认值为空。
* udp: 是否开启 UDP 协议的支持，true / false。默认值为 false。
* ip: 当开启 UDP 时，V2Ray 需要知道本机的 IP 地址。默认值为 127.0.0.1。
* timeout: 从 Socks 客户端读取数据的超时设置（秒），0 表示不限时。默认值为 0。

## VMess (Inbound / Outbound)
[[VMess]] 是一个加密传输协议，它分为传入和传出两部分，通常作为 V2Ray 客户端和服务器之间的桥梁。

* 名称：vmess
* 类型：Inbound / Outbound
* VMess 传出协议配置：
```javascript
{
  "vnext": [
    {
      "address": "127.0.0.1",
      "port": 37192,
      "users": [
        {
          "id": "27848739-7e62-4138-9fd3-098a63964b6b",
          "alterId": 10
        }
      ]
    }
  ]
}
```

其中：
* vnext：一个数组，包含一系列的服务器配置，其中每一个服务器：
  * address：服务器地址，仅支持 IP 地址。
  * port：服务器端口号。
  * users：一组服务器认可的用户，其中每一个用户：
    * id：VMess 用户的主 ID。
    * alterId (V2Ray 1.3): 为了进一步防止被探测，一个用户可以在主 ID 的基础上，再额外生成多个 ID。这里只需要指定额外的 ID 的数量，推荐值为 100。不指定的话，默认值是 0。最大值 65535。这个值必须和服务器端所指定的值相同。


* VMess 传入协议配置：
```javascript
{
  "clients": [
    {
      "id": "27848739-7e62-4138-9fd3-098a63964b6b",
      "level": 0,
      "alterId": 100
    }
  ],
  "features": {
    "detour": {
      "to": "tag_to_detour"
    }
  }
}
```

其中：
* clients：一组服务器认可的用户，其中每一个用户：
  * id：VMess 的用户 ID。
  * level：用户等级
    * 当 level 为 0 时，此用户不被信任，V2Ray 将对此用户进行严格的安全限制；
    * 当 level 大于 0 时，此用户被信任，V2Ray 将放宽对此用户的限制；
  * alterId (V2Ray 1.3+): 同 Inbound。
* features (V2Ray 1.5+): VMess 的特性配置：
  * detour: 转向 outboundDetour
    * to: 一个 outboundDetour 的 tag，详见[[配置文件]]
