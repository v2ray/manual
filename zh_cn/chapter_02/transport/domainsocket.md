# DomainSocket 传输方式

[![English][1]][2] [![German][3]][4] [![Russian][5]][6]

[1]: ../../resources/english.svg
[2]: https://www.v2ray.com/en/configuration/transport/domainsocket.html
[3]: ../../resources/german.svg
[4]: https://www.v2ray.com/de/configuration/transport/domainsocket.html
[5]: ../../resources/russian.svg
[6]: https://www.v2ray.com/ru/configuration/transport/domainsocket.html

Domain Socket 使用标准的 Unix domain socket 来传输数据。它的优势是使用了操作系统内建的传输通道，而不会占用网络缓存。相比起本地环回网络（local loopback）来说，Domain socket 速度略快一些。

目前仅可用于支持 Unix domain socket 的平台，如 macOS 和 Linux。在 Windows 上不可用。

配置：

```javascript
{
  "path": "/path/to/ds/file"
}
```

其中：

* `path`: 一个合法的文件路径。在运行 V2Ray 之前，这个文件必须不存在。

## 小贴士 {#tips}

* 如果指定了 domain socket 作为传输方式，在传入传出代理中配置的端口和 IP 地址将会失效，所有的传输由 domain socket 取代。
