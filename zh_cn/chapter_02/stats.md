# 统计信息

V2Ray 提供了一些关于其运行状况的统计信息。

示例配置：

```javascript
{
}
```

目前已有的统计信息如下：

* `user>>>[email]>>>traffic>>>uplink` (V2Ray 3.16+): 特定用户的上行流量，单位字节。
* `user>>>[email]>>>traffic>>>downlink` (V2Ray 3.16+): 特定用户的下行流量，单位字节。
* `inbound>>>[tag]>>>traffic>>>uplink` (V2Ray 3.18+): 特定传入代理的上行流量，单位字节。
* `inbound>>>[tag]>>>traffic>>>downlink` (V2Ray 3.18+): 特定传入代理的下行流量，单位字节。

## 小贴士 {#tips}

* 如果对应用户没有有效的 Email，则不会开启统计。
