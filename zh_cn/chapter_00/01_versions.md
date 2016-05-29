# 更新日志

## 2016.05.29 v1.14
* 修复了 HTTP 代理中一个可能导致崩溃的问题；
* [安装脚本](../chapter_01/install.md)中增加了一些功能；
* [DNS](../chapter_02/04_dns.md) 中增加了[静态路由](../chapter_05/00_config/08_static_hosts.md)功能；
* 官方服务器地址变动；

## 2016.05.16 v1.13
* 内置 DNS 服务，可搭配 chinasites 和 chinaip 进行更为精准的路由判断；
* 修复了一个 UDP 转发时的问题；

## 2016.05.01 v1.12.1
* 修复了 VMess 协议中的一个 bug。

## 2016.05.01 v1.12
* 再次尝试修复内存使用问题；
* 提升了 Shadowsocks 的性能；
* loglevel 增加了新的选项“none”表示不记录任何 log；

## 2016.04.18 v1.11
* 尝试修复内存使用问题。

## 2016.03.07 v1.10
* 修复了动态端口刷新时的性能问题。

## 2016.02.29 v1.9.1
* 修复了 Shadowsocks 中 OTA 的问题。

## 2016.02.29 v1.9
* Shadowsocks 支持了 Chacha20 加密方式；
* 默认配置文件增加了更多的直连网站；
* 动态端口中现已可以自动创建帐号，无需事先指定；

## 2016.02.22 v1.8
* 更新了安装脚本 install-release.sh （感谢 netcookies@)：
  * 现在可以自动停止 V2Ray 进程，并在更新完成后自动运行 V2Ray；
  * install-release.sh 接受 --proxy 参数并从指定的代理下载 V2Ray；
* 使用 Go 1.6 编译，提升了 AES 加密的性能；
* 一些小修小补；
* 官方服务器 IP 更新，请重新下载安装包以获得最新的配置。

## 2016.02.08 v1.7
* 提升了 UDP 转发的性能；
* 提升了 Shadowsocks 的安全性；
* 修复了一些问题；
* 祝大家新年快乐！

## 2016.02.01 v1.6
* 服务器端支持 Shadowsocks；
  * [协议详情](../chapter_02/02_protocols.md#shadowsocks)
  * [配置示例](../chapter_05/00_config/06_shadowsocks.md)

## 2016.01.25 v1.5
* 修复了一个 VMess 中的安全性问题，导致了 1.5 和之前版本不兼容，请同时升级你的客户端和服务器端；
* 修复了一个路由不能正常工作的问题； 
* [动态端口](../chapter_03/00_dynport.md)；
* 略微提升了性能；

## 2016.01.18 v1.4
* 更新了[安装脚本](../chapter_01/install.md)，在 Debian / Ubuntu / CentOS 7 中可自动安装和更新 V2Ray；

* 修复了一个 VMess 的内存使用问题；

## 2016.01.11 v1.3
* Wiki 中更新了一些英语页面（感谢 chenxiaoqino）；
* Docker 配置文件（感谢 adoot）；
* HTTP 代理（感谢 adoot）；
* 路由中内置了常见的[国内网站域名](../chapter_02/03_routing.md)；
* VMess 配置中新增了 [alterId 选项](../chapter_02/02_protocols.md)；
* 修复了若干小问题；

## 2015.12.14 v1.2
* 简洁且高效的国内 IP 路由；
* 错误日志可写入文件；
* 路由中支持正则表达式方式的域名匹配；
* 修复了一个 SOCKS 协议的兼容性 bug；

## 2015.12.07 v1.1
* 修复了一个 VMess 协议的 bug，也导致了 1.1 和 1.0 的应用程序不兼容，配置文件不受影响；
* 修复了一个 InboundDetourHandler 中的 bug；

## 2015.11.30 v1.0
V2Ray 1.0 正式版，包含以下功能：
* Socks 4 / 5 代理协议；
* 可以防止重放攻击的高速中继协议；
* 静态路由功能，用户可选择性屏蔽或代理指定的 IP 段或域名；
