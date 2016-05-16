# DNS 服务器

V2Ray 内置了一个 DNS 服务器，可以将 DNS 查询根据路由设置转发到不同的远程服务器中。

示例配置：
```javascript
{
  "servers": [
      "8.8.8.8",
      "8.8.4.4",
      "localhost"
  ]
}
```

其中：
* servers: 指定一个 DNS 服务器列表，每一项的值可以是：
  * IP: 目前只支持传统的端口为 53 的 DNS 服务器；
  * "localhost": 这是一个特殊值，表示使用本机预设的 DNS 配置；

若要使 DNS 服务生效，需要配置路由功能中的 DomainStrategy。

由此 DNS 服务器所发出的 DNS 查询请求，会自动根据路由配置进行转发，无需额外配置。
