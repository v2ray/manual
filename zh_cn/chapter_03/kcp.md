# KCP/UDP

V2Ray 从 1.17 开始加入了一种新的流式传输协议，用于克服传统的 TCP 在某些场景下的不足之处。
新协议在 [KCP 协议](https://github.com/skywind3000/kcp)的基础上进行了一些封装，可以无缝替换 TCP。

在此感谢：
* @skywind3000 发明并实现了 KCP 协议；
* @xtaci 将 KCP 由 C 语言实现翻译成 Go；
* @xiaokangwang 测试 KCP 与 V2Ray 的整合并提交了最初的 PR。

目前 V2Ray 中只有 VMess 协议可以使用 KCP，开启的方式如下：

* 在 Inbound 和 Outbound 配置中添加 streamSettings 并设置 network 为 "kcp"。
VMess 连接两端的 Inbound 和 Outbound 需要同时设置 kcp，否则无法连通。如果服务器端使用了动态端口，也需要指定 kcp。

```javascript
"inbound": {
  "port": 8888,
  "protocol": "vmess",
  "settings": {}, // 略
  "streamSettings": {
    "network": "kcp" // 可选的值有 "kcp" 和 "tcp"
  }
}
```

* （可选）配置 KCP 选项，详见[配置文件格式](../chapter_02/01_overview.md)。

目前新协议还在测试过程中，可能有各种各样的问题。如发现问题请及时提交 issue。

需要注意的问题：
* 新的协议使用 UDP 进行传输，请确保防火墙设置正确；
* KCP 牺牲带宽来降低延迟。传输同样的内容，KCP 一般比 TCP 消耗更多的流量；

