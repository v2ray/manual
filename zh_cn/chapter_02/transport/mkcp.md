---
refcn: chapter_02/transport/mkcp
refen: configuration/transport/mkcp
---

# mKCP 传输方式

mKCP 使用 UDP 来模拟 TCP 连接，请确定主机上的防火墙配置正确。

配置：

```javascript
{
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
```

其中：

* `mtu`: 最大传输单元（maximum transmission unit），请选择一个介于 `576` - `1460` 之间的值。默认值为 `1350`。
* `tti`: 传输时间间隔（transmission time interval），单位毫秒（ms），mKCP 将以这个时间频率发送数据。请选译一个介于 `10` - `100` 之间的值。默认值为 `50`。
* `uplinkCapacity`: 上行链路容量，即主机发出数据所用的最大带宽，单位 MB/s，默认值 `5`。
  * 注意是 Byte 而非 bit；
  * 可以设置为 `0`，表示一个非常小的带宽；
* `downlinkCapacity`: 下行链路容量，即主机接收数据所用的最大带宽，单位 MB/s，默认值 `20`。
  * 注意是 Byte 而非 bit；
  * 可以设置为 `0`，表示一个非常小的带宽；
* `congestion`: 是否启用拥塞控制，默认值为 `false`。
  * 开启拥塞控制之后，V2Ray 会自动监测网络质量，当丢包严重时，会自动降低吞吐量；当网络畅通时，也会适当增加吞吐量。
* `readBufferSize`: 单个连接的读取缓冲区大小，单位是 MB。默认值为 `2`。
* `writeBufferSize`: 单个连接的写入缓冲区大小，单位是 MB。默认值为 `2`。
* `header`: 数据包头部伪装设置：
  * `type`: 伪装类型，可选的值有：
    * `"none"`: 默认值，不进行伪装，发送的数据是没有特征的数据包。
    * `"srtp"`: 伪装成 SRTP 数据包，会被识别为视频通话数据（如 FaceTime）。
    * `"utp"`: 伪装成 uTP 数据包，会被识别为 BT 下载数据。
    * `"wechat-video"`: 伪装成微信视频通话的数据包。
    * `"dtls"`: 伪装成 DTLS 1.2 数据包。
    * `"wireguard"` (V2Ray 3.38+): 伪装成 WireGuard 数据包。(并不是真正的 WireGuard 协议)

## 小贴士 {#tip}

* `uplinkCapacity` 和 `downlinkCapacity` 决定了 mKCP 的传输速度。以客户端发送数据为例，客户端的 `uplinkCapacity` 指定了发送数据的速度，而服务器端的 `downlinkCapacity` 指定了接收数据的速度。两者的值以较小的一个为准。推荐把 `downlinkCapacity` 设置为一个较大的值，比如 100，而 `uplinkCapacity` 设为实际的网络速度。当速度不够时，可以逐渐增加 `uplinkCapacity` 的值，直到带宽的两倍左右。
* `readBufferSize` 和 `writeBufferSize` 指定了单个连接所使用的内存大小。在需要高速传输时，指定较大的 `readBufferSize` 和 `writeBufferSize` 会在一定程度上提高速度，但也会使用更多的内存。在网速不超过 20MB/s 时，默认值 1MB 可以满足需求；超过之后，可以适当增加 `readBufferSize` 和 `writeBufferSize` 的值，然后手动平衡速度和内存的关系。
* mKCP 使用 UDP 进行传输，请确保防火墙设置正确；
* mKCP 牺牲带宽来降低延迟。传输同样的内容，mKCP 一般比 TCP 消耗更多的流量；

## 鸣谢 {#credits}

* @skywind3000 发明并实现了 KCP 协议；
* @xtaci 将 KCP 由 C 语言实现翻译成 Go；
* @xiaokangwang 测试 KCP 与 V2Ray 的整合并提交了最初的 PR。

## 对 KCP 协议的改进

### 更小的协议头

原生 KCP 协议使用了 24 字节的固定头部，而 mKCP 修改为数据包 18 字节，确认（ACK）包 16 字节。更小的头部有助于躲避特征检查，并加快传输速度。

另外，原生 KCP 的单个确认包只能确认一个数据包已收到，也就是说当 KCP 需要确认 100 个数据已收到时，它会发出 24 \* 100 = 2400 字节的数据。其中包含了大量重复的头部数据，造成带宽的浪费。mKCP 会对多个确认包进行压缩，100 个确认包只需要 16 + 2 + 100 \* 4 = 418 字节，相当于原生的六分之一。

### 确认包重传

原生 KCP 协议的确认（ACK）包只发送一次，如果确认包丢失，则一定会导致数据重传，造成不必要的带宽浪费。而 mKCP 会以一定的频率重发确认包，直到发送方确认为止。单个确认包的大小为 22 字节，相比起数据包的 1000 字节以上，重传确认包的代价要小得多。

### 连接状态控制

mKCP 可以有效地开启和关闭连接。当远程主机主动关闭连接时，连接会在两秒钟之内释放；当远程主机断线时，连接会在最多 30 秒内释放。

原生 KCP 不支持这个场景。
