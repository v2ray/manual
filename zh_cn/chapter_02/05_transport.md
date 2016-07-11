# 底层传输配置

底层传输（transport）配置指定了 V2Ray 如何使用 TCP、UDP 等基础网络协议。配置分为两部分，一是全局设置，二是分连接配置。

## 全局配置
全局配置位于配置文件的 "transport" 项。

```javascript
{
  "tcpSettings": {
    "connectionReuse": true
  },
  "kcpSettings": {
    "mtu": 1350,
    "tti": 20,
    "uplinkCapacity": 5,
    "downlinkCapacity": 20,
    "congestion": false
  }
}
```

其中：
* tcpSettings: 针对 TCP 连接的配置：
  * connectionReuse: 是否重用 TCP 连接，默认值为 true。
    * 目前只对 VMess 起作用；
    * 当值为 true 时，V2Ray 会在传输完一段数据之后，继续使用同一个 TCP 连接来传输下一段数据。
* kcpSettings: 针对 KCP 连接的配置：
  * mtu: 最大传输单元（maximum transmission unit），请选择一个介于 576 - 1460 之间的值。默认值为 1350。
  * tti: 传输时间间隔（transmission time interval），单位毫秒（ms），KCP 将以这个时间频率发送数据。请选译一个介于 10 - 100 之间的值，默认值为 20。
  * uplinkCapacity: 上行链路容量，即主机发出数据所用的最大带宽，单位 MB，默认值 5。
    * 注意是 Byte 而非 bit；
    * 可以设置为 0，表示一个非常小的带宽；
  * downlinkCapacity: 下行链路容量，即主机接收数据所用的最大带宽，单位 MB，默认值 20。
    * 注意是 Byte 而非 bit；
    * 可以设置为 0，表示一个非常小的带宽；
  * congestion: 是否启用拥塞控制，默认值为 false。
    * 开启拥塞控制之后，V2Ray 会自动监测网络质量，当丢包严重时，会自动降低吞吐量；当网络畅通时，也会适当增加吞吐量。

## 分连接配置
每一个传入、传出连接都可以配置不同的传输配置，在 inbound、inboundDetour、outbound、outboundDetour 的每一项中，都可以设置 streamSettings 来进行一些传输的配置。

```javascript
{
  "network": "tcp",
  "security": "none",
  "tlsSettings": {
    "allowInsecure": false,
    "certificates": [
      {
        "certificateFile": "/path/to/certificate.crt",
        "keyFile": "/path/to/key.key"
      }
    ]
  }
}
```
* streamSettings (V2Ray 1.17+): 流式传输协议配置：
  * network: 数据流所使用的网络，可选的值为 "tcp" 或 "kcp"，默认值为 "tcp"；
    * 目前仅有 VMess 协议支持 kcp，其它协议在 kcp 上会传输失败。
  * security: 是否启入传输层加密，支持的选项有 "none" 表示不加密（默认值），"tls" 表示使用 [TLS](https://en.wikipedia.org/wiki/Transport_Layer_Security)。
  * tlsSettings: TLS 配置。TLS 由 Golang 提供，支持 TLS 1.2，不支持 Chacha 加密方式，不支持 DTLS。
    * allowInsecure: 是否允许不安全连接（用于客户端）。当值为 true 时，V2Ray 不会检查远端主机所提供的 TLS 证书的有效性。
    * certificates: 证书列表（用于服务器端），其中每一项表示一个证书：
      * certificateFile: 证书文件，如使用 OpenSSL 生成，后缀名为 .crt。
      * keyFile: 密钥文件，如使用 OpenSSL 生成，后缀名为 .key。目前暂不支持需要密码的 key 文件。
