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
    "congestion": false,
    "readBufferSize": 1,
    "writeBufferSize": 1,
    "header": {
      "type": "none"
    }
  }
}
```

其中：
* `tcpSettings`: 针对 TCP 连接的配置：
  * `connectionReuse`: 是否重用 TCP 连接，默认值为 `true`。
    * 目前只对 VMess 起作用；
    * 当值为 `true` 时，V2Ray 会在传输完一段数据之后，继续使用同一个 TCP 连接来传输下一段数据。
* `kcpSettings`: 针对 [mKCP](../chapter_03/kcp.md) 连接的配置：
  * `mtu`: 最大传输单元（maximum transmission unit），请选择一个介于 `576` - `1460` 之间的值。默认值为 `1350`。
  * `tti`: 传输时间间隔（transmission time interval），单位毫秒（ms），mKCP 将以这个时间频率发送数据。请选译一个介于 `10` - `100` 之间的值，默认值为 `50`。
  * `uplinkCapacity`: 上行链路容量，即主机发出数据所用的最大带宽，单位 MB，默认值 `5`。
    * 注意是 Byte 而非 bit；
    * 可以设置为 `0`，表示一个非常小的带宽；
  * `downlinkCapacity`: 下行链路容量，即主机接收数据所用的最大带宽，单位 MB，默认值 `20`。
    * 注意是 Byte 而非 bit；
    * 可以设置为 `0`，表示一个非常小的带宽；
  * `congestion`: 是否启用拥塞控制，默认值为 `false`。
    * 开启拥塞控制之后，V2Ray 会自动监测网络质量，当丢包严重时，会自动降低吞吐量；当网络畅通时，也会适当增加吞吐量。
  * `readBufferSize`: 单个连接的读取缓冲区大小，单位是 MB。默认值为 `1`。
  * `writeBufferSize`: 单个连接的写入缓冲区大小，单位是 MB。默认值为 `1`。
  * `header`: 数据包头部伪装设置：
    * `type`: 伪装类型，可选的值有： 
      * `"none"`: 默认值，不进行伪装，发送的数据是没有特征的数据包；
      * `"srtp"`: 伪装成 SRTP 数据包，会被识别为视频通话数据。
      * `"utp"` (V2Ray 1.24+): 伪装成 uTP 数据包，会被识别为 BT 下载数据。

### 配置建议
* `uplinkCapacity` 和 `downlinkCapacity` 决定了 mKCP 的传输速度。以客户端发送数据为例，客户端的 `uplinkCapacity` 指定了发送数据的速度，而服务器端的 `downlinkCapacity` 指定了接收数据的速度。两者的值以较小的一个为准。推荐把 `downlinkCapacity` 设置为一个较大的值，比如 100，而 `uplinkCapacity` 设为实际的网络速度。当速度不够时，可以逐渐增加 `uplinkCapacity` 的值，直到带宽的两倍左右。
* `readBufferSize` 和 `writeBufferSize` 指定了单个连接所使用的内存大小。在需要高速传输时，指定较大的 `readBufferSize` 和 `writeBufferSize` 会在一定程度上提高速度，但也会使用更多的内存。在网速不超过 20MB/s 时，默认值 1MB 可以满足需求；超过之后，可以适当增加 `readBufferSize` 和 `writeBufferSize` 的值，然后手动平衡速度和内存的关系。

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

其中：
* `network`: 数据流所使用的网络，可选的值为 `"tcp"` 或 `"kcp"`，默认值为 `"tcp"`；
  * 目前仅有 VMess 协议支持 kcp，其它协议在 kcp 上会传输失败。
* `security`: 是否启入传输层加密，支持的选项有 `"none"` 表示不加密（默认值），`"tls"` 表示使用 [TLS](https://en.wikipedia.org/wiki/Transport_Layer_Security)。
* `tlsSettings`: TLS 配置。TLS 由 Golang 提供，支持 TLS 1.2，不支持 Chacha 加密方式，不支持 DTLS。
  * `allowInsecure`: 是否允许不安全连接（用于客户端）。当值为 true 时，V2Ray 不会检查远端主机所提供的 TLS 证书的有效性。
  * `certificates`: 证书列表（用于服务器端），其中每一项表示一个证书：
    * `certificateFile`: 证书文件，如使用 OpenSSL 生成，后缀名为 .crt。
    * `keyFile`: 密钥文件，如使用 OpenSSL 生成，后缀名为 .key。目前暂不支持需要密码的 key 文件。
