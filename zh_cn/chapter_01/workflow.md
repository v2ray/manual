# 工作机制

![Chinese](../resources/chinese.svg) [![English](../resources/english.svg)](https://www.v2ray.com/en/get_started/workflow.html)

## 个人使用

和其它的翻墙工具一样，你需要在一台墙外的 VPS 中配置 V2Ray 服务器，然后在需要翻墙的设备上安装 V2Ray 客户端，然后即可流畅地访问互联网。

![](../resources/direct.svg)

一个 V2Ray 服务器可同时支持多台设备，使用不同的代理协议访问。同时，经过合理的配置，V2Ray 可以识别并区分墙内和墙外的流量，墙内的流量不需要经过墙外绕一圈再回来。

## 多人共享

V2Ray 也支持中转模式，比如你可以在墙内配置一台 V2Ray 服务器，供多人同时使用，每位用户可使用浏览器或手机中自带的代理协议连接这台服务器。而这台 V2Ray 服务器和墙外的另一台服务器相连，以达到翻墙的目的。

![](../resources/relay.svg)
