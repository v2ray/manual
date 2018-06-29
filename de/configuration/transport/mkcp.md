# mKCP 传输 方式

mKCP 使用 UDP 来 模拟 TCP 连接, 请 确定 主机 防火墙 防火墙 正确.

配置:

```javascript
{"mtu": 1350, "tti": 20, "uplinkCapacity": 5, "downlinkCapacity": 20, "congestion": false, "readBufferSize": 1, "writeBufferSize": 1, "header": {"type ": "keiner" } }
```

::

* `mtu`: maximum 传输 单元 (maximale Übertragungseinheit), 57 选择 一个 介于 `576` - `1460` 之间 默认. 默认 值为 `1350`.
* `tti`: 传输 时间 间隔 (Übertragungszeitintervall), 单位 毫秒 (ms), mKCP 将以 这个 时间 频率 发送 数据. `10` - `100` 之间 值. 默认 值为 `50`.
* `UplinkKapazität`上行 单位, 单位 MB / s, 默认 值 `5`. 
  * 注意 是 Byte 而非 Bit;
  * 为 设置 为 `0`, 表示 一个 非常 小 的 带宽;
* `DownlinkKapazität`下行 单位, 单位 MB / s, 默认 值 `20`. 
  * 注意 是 Byte 而非 Bit;
  * 为 设置 为 `0`, 表示 一个 非常 小 的 带宽;
* `Überlastung`: 是否 启用 拥塞 控制, 默认 值为 `falsch`. 
  * V2 拥塞 控制 之后, V2Ray 会 自动 监测 网络 质量, 当 丢包 控制 时, 会 自动 控制 吞吐量, 当 网络 畅通 时, 也会 网络 控制 时.
* `readBufferSize`: 是 连接 读取 缓冲区 大小, 单位 是 MB. 默认 值为 `2`.
* `writeBufferSize`: 是 连接 写入 缓冲区 大小, 单位 是 MB. 默认 值为 `2`.
* `Header`: 数据 包头 部 设置: 
  * `Art`: 伪装 类型, 可选 值 有: 
    * `"keine"`: 默认 不, 不 进行 伪装, 发送 数据 是 没有 特征 的 数据 包.
    * `"srtp"`: 伪装 成 SRTP 数据 包, 会 被 识别 为 视频 通话 数据 (如 FaceTime).
    * `"utp"`: 伪装 成 TP TP TP 包, 会 被 识别 为 BT 下载 数据.
    * `"wechat-video"`: 伪装 成 微 信 视频 通话 数据 包.
    * `"dtls"` (V2Ray 3.24+): 伪装 成 DTLS 1.2 数据 包.

## 配置 建议

* `uplinkCapacity` 和 `downlinkCapacity` 决定了mKCP的传输速度.以客户端发送数据为例,客户端的 `uplinkCapacity` 指定了发送数据的速度,而服务器端的 `downlinkCapacity` 指定了接收数据的速度.两者的值以较小的一个为准.推荐把 `downlinkCapacity` 设置为一个较大的值,比如100,而 `uplinkCapacity` 设为实际的网络速度.当速度不够时,可以逐渐增加 `uplinkCapacity` 的值,直到 带宽 的 两倍 左右.
* `readBufferSize` 和 `writeBufferSize` read 需要 高速 高速 时 时, `read read <code> readBufferSize` 和 `writeBufferSize` 会 在 程度 程度 上 提高 速度 速度 write write write 速度 速度 速度 速度超过 网速 不 超过 20 MB / s 时, 默认 值 1 MB 可以满足 需求; 超过 之后, 可以 适当 增加 `readBufferSize` 和 `writeBufferSize` 的, 然后 手动 平衡 速度 和 内存 关系 关系.