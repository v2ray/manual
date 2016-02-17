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
