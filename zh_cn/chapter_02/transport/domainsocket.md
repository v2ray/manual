---
refcn: chapter_02/transport/domainsocket
refen: configuration/transport/domainsocket
---

# DomainSocket 传输方式

Domain Socket 使用标准的 Unix domain socket 来传输数据。它的优势是使用了操作系统内建的传输通道，而不会占用网络缓存。相比起本地环回网络（local loopback）来说，Domain socket 速度略快一些。

目前仅可用于支持 Unix domain socket 的平台，如 macOS 和 Linux。在 Windows 上不可用。

{% hint style='info' %}
如果指定了 domain socket 作为传输方式，在入站出站代理中配置的端口和 IP 地址将会失效，所有的传输由 domain socket 取代。
{% endhint %}

## DomainSocketObject

`DomainSocketObject`对应传输配置中的`dsSettings`项。

```javascript
{
  "path": "/path/to/ds/file"
}
```

> `path`: string

一个合法的文件路径。在运行 V2Ray 之前，这个文件必须不存在。
