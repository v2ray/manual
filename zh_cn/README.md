# Project V

![Chinese](resources/chinesec.svg) [![English](resources/english.svg)](https://www.v2ray.com/en/)

Project V 包含一系列工具，帮助你打造专属的定制网络体系。

## 简单介绍

Project V 提供了单一的内核和多种界面操作方式。内核（V2Ray）用于实际的网络交互、路由等针对网络数据的处理，而外围的用户界面程序提供了方便直接的操作流程。

V2Ray 的主要作用是根据用户的配置，对于传入的网络连接进行一定处理，然后发往指定的服务器。它是一个命令行程序，可以接受一个 JSON 格式的配置文件。

本站点主要介绍 V2Ray 本身的工作方式。其它相关程序的介绍由在左侧下方的链接进入。

## 主要特性

### 多协议支持

V2Ray 原生支持 Socks、HTTP、Shadowsocks、VMess 等协议。

* 在一个进程中可以配置不同的端口使用不同的协议进行通讯。
* 通过不同的传入和传出协议组合，灵活转换通讯格式。

### 可变传输载体

上述协议均可使用 TLS、TCP、mKCP、WebSocket 等传输方式进行传输。

### 灵活的路由

通过内置的路由功能，V2Ray 可以灵活地实现选择性转发、直连或是阻止部分连接。

## 更新本站点

本站点由 GitBook 生成，并托管于 GitHub。如需修改本站的内容，请向[这个 Repo](https://github.com/v2ray/manual) 提交 Pull Request。
