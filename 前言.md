# 前言

V2Ray 项目是一个免费的跨平台工具，可以助你加密网络流量，绕过网络供应商的干扰。

## 功能特色
### 多用户支持
V2Ray 提供的 VMess 协议支持多用户，只需要开启一个端口，就可以让多个用户以不同的 ID 连接进来，不需要一个用户对应一个端口。

### [[动态端口]]
经过配置，V2Ray 服务器端可以周期性改动通信端口，以规避某些运营商的流量限制。

### 灵活配置
V2Ray 支持多种代理协议，并可按需求灵活配置。使用同一个 V2Ray 应用程序，搭配不同的配置文件，即可完成代理客户端、服务器或者中转的不同使用场景。

### 内置路由
V2Ray 内置了[[路由功能|路由配置]]，可以灵活地设置哪些网站（或 IP）使用代理，哪些网站（或 IP）直连。相较于使用浏览器的 PAC 设置，V2Ray 的路由功能更为高效，在某些使用场景下配置更灵活。

## 支持平台
V2Ray 在以下平台中可用：
* Windows Vista 及之后版本（x86 / amd64）；
* Mac OS X 10.7 及之后版本（amd64）；
* Linux 2.6.23 及之后版本（x86 / amd64 / arm / arm64）；
  * 包括但不限于 Debian 7 / 8、Ubuntu 12.04 / 14.04 及后续版本、CentOS 6 / 7、Arch Linux；

## 联系方式
* 聊天室：[https://gitter.im/v2ray/v2ray-core](https://gitter.im/v2ray/v2ray-core)
* Twitter：[https://twitter.com/projectv2ray](https://twitter.com/projectv2ray)
* 私下联系：love@v2ray.com [PGP 公钥](https://github.com/v2ray/v2ray.github.io/blob/master/content/pgp.md)

## 新手上路
* V2Ray 的[[工作机制]]
* [[下载并运行 V2Ray|初次使用]]
* [[配置 V2Ray 客户端|客户端配置]]
* [[常见错误信息]]
* [[常用配置列表]]
* [[网友经验]]

## 进阶使用
* [[配置文件]]
* [[协议列表]]
* [[Effective V2Ray]]

## 开发相关
* [[开发计划]]
* [[开发指引]]
* [[核心设计]]