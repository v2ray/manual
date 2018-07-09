# 统计信息

[![English][1]][2] [![German][3]][4] [![Russian][5]][6]

[1]: ../resources/english.svg
[2]: https://www.v2ray.com/en/configuration/stats.html
[3]: ../resources/german.svg
[4]: https://www.v2ray.com/de/configuration/stats.html
[5]: ../resources/russian.svg
[6]: https://www.v2ray.com/ru/configuration/stats.html

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
