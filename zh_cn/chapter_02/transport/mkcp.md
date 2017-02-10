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
* `uplinkCapacity`: 上行链路容量，即主机发出数据所用的最大带宽，单位 MB，默认值 `5`。
  * 注意是 Byte 而非 bit；
  * 可以设置为 `0`，表示一个非常小的带宽；
* `downlinkCapacity`: 下行链路容量，即主机接收数据所用的最大带宽，单位 MB，默认值 `20`。
  * 注意是 Byte 而非 bit；
  * 可以设置为 `0`，表示一个非常小的带宽；
* `congestion`: 是否启用拥塞控制，默认值为 `false`。
  * 开启拥塞控制之后，V2Ray 会自动监测网络质量，当丢包严重时，会自动降低吞吐量；当网络畅通时，也会适当增加吞吐量。
* `readBufferSize`: 单个连接的读取缓冲区大小，单位是 MB。默认值为 `2`。
* `writeBufferSize`: 单个连接的写入缓冲区大小，单位是 MB。默认值为 `1`。默认值为 `2`。
* `header`: 数据包头部伪装设置：
  * `type`: 伪装类型，可选的值有：
    * `"none"`: 默认值，不进行伪装，发送的数据是没有特征的数据包。
    * `"srtp"`: 伪装成 SRTP 数据包，会被识别为视频通话数据（如 FaceTime）。
    * `"utp"`: 伪装成 uTP 数据包，会被识别为 BT 下载数据。
    * `"wechat-video"`: 伪装成微信视频通话的数据包。

## 配置建议

* `uplinkCapacity` 和 `downlinkCapacity` 决定了 mKCP 的传输速度。以客户端发送数据为例，客户端的 `uplinkCapacity` 指定了发送数据的速度，而服务器端的 `downlinkCapacity` 指定了接收数据的速度。两者的值以较小的一个为准。推荐把 `downlinkCapacity` 设置为一个较大的值，比如 100，而 `uplinkCapacity` 设为实际的网络速度。当速度不够时，可以逐渐增加 `uplinkCapacity` 的值，直到带宽的两倍左右。
* `readBufferSize` 和 `writeBufferSize` 指定了单个连接所使用的内存大小。在需要高速传输时，指定较大的 `readBufferSize` 和 `writeBufferSize` 会在一定程度上提高速度，但也会使用更多的内存。在网速不超过 20MB/s 时，默认值 1MB 可以满足需求；超过之后，可以适当增加 `readBufferSize` 和 `writeBufferSize` 的值，然后手动平衡速度和内存的关系。
