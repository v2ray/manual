---
refcn: chapter_00/01_versions
refen: welcome/versions
---

# 更新日志

本页列出了常规版本的功能升级记录，未列出的版本通常为 bug 修复。

## 2019.07.12 v4.20.0

* 支持H2C（HTTP2不强制TLS）
* 日志使用none级别时禁用所有显示
* 修复Bazel 0.26+兼容
* 一些代码优化

## 2019.06.03 v4.19.1

* 路由支持自定义文件
* 安装脚本支持小版本检测
* 一些代码优化

## 2019.05.18 v4.18.2

* 修复Windows下配置文件过大读取错误

## 2019.04.15 v4.18.1

 * 支持TLS1.3
 * 修复错误域名导致的崩溃
 * 修改GoCache目录的强制要求

## 2019.03.01 v4.18

* 路由中的端口列表新增了混合格式。
* 更新了路由中`geosite`的说明，和 DNS 服务器中静态域名列表的说明。
* TLS 配置中添加了禁用系统 CA 的选项。
* 路由中添加了流量属性检测，可用于检测 URL。

## 2019.02.22 v4.17

* V2Ctl 中新增了 `tlsping` 工具。

## 2019.02.15 v4.16

使用相关:

* DNS 传出代理支持修改目标 DNS 服务器的设定。

开发相关:

* 'ext' 仓库已完全迁移到 'core'。[#1541](https://github.com/v2ray/v2ray-core/issues/1541)

## 2019.02.08 v4.15

* DNS 传出代理。

## 2019.02.01 v4.14

* DNS 支持了静态域名到域名的匹配。

## 2019.01.18 v4.13

* 更新了 Quic 库，与之前的版本不兼容。
* DNS 配置中新增了`tag`选项。

## 2019.01.11 v4.11

开发相关:

* 新增了 [core.DialUDP](https://github.com/v2ray/v2ray-core/blob/b52725cf659e0f7a38fed2eb36a5a792843bd54f/functions.go#L65)
* [internet.DialSystem](https://github.com/v2ray/v2ray-core/blob/a1b552f9487d2687228dd1d89003087331f62eab/transport/internet/dialer.go#L66) 现在会调用 [internet.ListenSystemPacket](https://github.com/v2ray/v2ray-core/blob/a1b552f9487d2687228dd1d89003087331f62eab/transport/internet/tcp_hub.go#L65) 去建立 UDP 连接。

## 2018.12.07 v4.8

使用相关:

* Bug 修复

开发相关:

* 新增了 [API 文档](https://github.com/v2ray/v2ray-core/blob/master/annotations.go#L13)
* 新增了 [internet.RegisterListenerController](https://github.com/v2ray/v2ray-core/blob/v4.8.0/transport/internet/system_listener.go#L63) 方法
* 新增了 [internet.RegisterDialerController](https://github.com/v2ray/v2ray-core/blob/v4.8.0/transport/internet/system_dialer.go#L105) 方法

## 2018.11.30 v4.7

* Freedom 中新增了 UseIPv4 和 UseIPv6 模式。
* 传输方式新增了 QUIC。

## 2018.11.23 v4.6

* Freedom 的`"UseIP"`模式会根据出站所用的 IP 地址自动使用 IPv4 或 IPv6 目标地址。

## 2018.11.16 v4.4

* 路由中新增了负载均衡配置。
* 优化了内存使用效率。

## 2018.11.05 v4.1

* 配置文件格式简化。主要是传入传出代理和路由部分。旧版格式仍然可用，但推荐尽快升级到最新格式。
* 优化了 GeoIP 的性能，减少了内存占用，提升了匹配效率。

## 2018.11.02 v4.0

* 反向代理
* 新增了 ppc64 和 ppc64le 预编译包。

## 2018.10.12 v3.47

* 升级了自动构建工具

## 2018.09.28 v3.44

* Dokodemo-door 现已支持 Linux 的 TProxy。

## 2018.09.21 v3.43

* DNS 查询支持了按域名选择服务器的功能。

## 2018.09.14 v3.40

* 传输配置中新增了连接选项，可用于配置 VPN。
* 传输配置中新增了 TCP Fast Open 选项。

## 2018.09.03 v3.38

* mKCP 中新增了 WireGuard 伪装。
* 修复了 mips/mips64 中 softfloat 版本的编译问题。

## 2018.08.31 v3.37

* 优化了读取网络连接时的性能，见[环境变量](../chapter_02/env.md)。
* VMess 在 ARM64 平台上将默认使用 AES-128-GCM 作为加密方式。
* 使用 Go 1.11 编译。

## 2018.08.24 v3.36

* 大幅提升了路由中子域名（`domain:`）匹配的效率。
* 路由中支持了完整域名匹配。

## 2018.08.07 v3.34

* 在大多数设备上有了更精确的内存控制

## 2018.07.27 v3.32

* 现在可以探测 BitTorrent 流量了。
* 路由配置中新增了`protocol`选项用于按流量类型进行路由选择。
* 路由配置中新增了`geosite:speedtest`用于适配所有的 Speedtest.net 公用服务器。

## 2018.07.20 v3.31

* 新增了 [Domain Socket 传输方式](../chapter_02/transport/domainsocket.md) (感谢 @xiaokangwang)。

## 2018.07.13 v3.30

* 解决了一个可能会导致 mKCP 断流的问题。
* 感谢来自俄罗斯的朋友，我们现在有[俄语文档](https://www.v2ray.com/ru/)了。

## 2018.07.06 v3.29

* 新增了 MTProto 代理协议。

## 2018.06.29 v3.27

* DNS 支持了 EDNS client subnet。
* DNS 的静态 IP 匹配现在支持子域名了。

## 2018.06.15 v3.26

* 新增了 Dragonfly BSD 的预编译版本。

## 2018.06.01 v3.24

* JSON 配置中新增了用户级别的缓存控制选项。
* mKCP 新增了 DTLS 伪装。
* TLS 现在默认只使用 TLS 1.3 推荐的加密套件。

## 2018.05.25 v3.23

* JSON 配置文件中，端口支持从环境变量加载。
* JSON 配置文件支持从指定文件加载 IP 和域名。

## 2018.04.20 v3.19

* 入站代理的流量统计。

## 2018.04.13 v3.17

* V2Ray 可直接加载来自 HTTP(s) 的配置文件。
* V2Ray 的 TLS 可使用 CA 证书自动为任意域名签发新的证书。
* [HTTP/2](../chapter_02/transport/h2.md) 传输方式。

## 2018.04.06 v3.16

* [统计信息](../chapter_02/stats.md)。开启方式略麻烦，请仔细看文档。
* Shadowsocks 入站协议现在可以只监听 UDP 端口而不监听 TCP 了。强烈建议不在同一端口上同时监听 TCP 和 UDP。

## 2018.03.02 v3.11

* VMess Inbound 提供了一个选项，用于禁止客户端使用不安全的加密方式。
* 提供了 ARMv7 编译版。
* 提供了不要求 FPU 的 MIPS 编译版。

## 2018.02.23 v3.10

* 日志格式修改，每条日志前添加了 Session ID，用于区分不同的代理请求。
* 修复了一些问题。

## 2018.02.16 v3.9

* 新年快乐!
* 修复了一些问题。

## 2018.02.09 v3.7

* 开发者预览：[远程控制](../chapter_02/api.md)。
* 修复了一些问题。

## 2017.12.29 v3.5

* Geoip 支持名为“Private”的私有地址列表。

## 2017.12.22 v3.4

* Websocket 现在可以识别 X-Forwarded-For 并用做源地址。
* 支持 s390x 平台。

## 2017.12.08 v3.1

* 支持[本地策略](../chapter_02/policy.md)
* 支持从环境变量指定的路径加载配置文件

## 2017.12.01 v3.0

* 支持 Shadowsocks AEAD

## 2017.11.18 v2.50

* `v2ray` 现在会尝试使用 `v2ctl` 进行配置文件解析，请确保这两个文件在同一目录下；
* 路由中新增 `IPOnDemand` 策略进行同步 IP 解析；

## 2017.11.10 v2.47

* `geosite` 的数据现在放在 `geosite.dat` 文件中了。
* 一些修复。

## 2017.11.03 v2.46

* 路由中添加 `geosite:cn`，等效于现有的`chinasites`，但更加灵活。
* 路由中添加 `geoip`。
  * 安装包中新增了`geoip.dat`文件，包含所有`geoip`信息，此文件必须和`v2ray`程序放置于同一路径下。由于安装脚本未及时更新，服务器端和部分客户端可能需要手动复制此文件。
* 安装包中新增 `v2ctl` 程序，可使用命令`v2ctl verify /path/to/v2ray`来验证`v2ray`程序签名的有效性。

## 2017.10.27 v2.44

* HTTP 代理中加入了 Basic Authentication 支持。
* 修复了一些 bug。

## 2017.10.06 v2.40

* 修复了导致内存泄漏的问题。

## 2017.09.29 v2.39

* 当远程服务器关闭连接时，入站代理现在会尽快断开与客户端的连接。
* 默认连接超时时间更改为 5 分钟。

## 2017.05.12 v2.27

* 路由中新增了“域名”匹配选项。

## 2017.05.02 v2.26

* 各种稳定性修复。

## 2017.04.28 v2.25

* 可以简单地探测 HTTP 和 HTTPS 流量并根据其内容进行转发。

## 2017.04.21 v2.24

* 修复了 Mux 的稳定性问题。
* 提升了总体的内存使用效率。

## 2017.04.15 v2.23

* 提升了 Mux 的性能。
* Mux 中可以配置并发连接数了。
* 提升了 HTTP 代理的性能。
* 移除了 connectionReuse 的配置（由 Mux 替代）。

## 2017.04.08 v2.22

* Mux.Cool 协议

## 2017.02.25 v2.20

* 安装包中可执行文件附带了 gpg 签名。
* Windows 安装包中带了新的 wv2ray.exe，运行时不会出现任何界面。

## 2017.02.18 v2.19

* 服务器端强制开启防重放攻击（Anti replay attack）机制。
  * 不会影响任何现有客户端。
* VMess AES-128-GCM / Chacha20-Poly1305 / None 加密方式升级。
  * 如正在使用其中任何一个加密方式，请同时升级客户端和服务器。
  * AES-128-CFB 不受影响。
* 使用 Golang 1.8 编译，加入对 32 位 MIPS 的支持。

## 2017.02.11 v2.18

* 清理了 WebSocket 相关的代码。
* 移除了 allowPassive 设置。现在的行为相当于 allowPassive = true。
* Bug 修复。

## 2017.02.04 v2.17

* Bug 修复。

## 2017.01.28 v2.16

* Freedom 中可以指定一个重定向地址，将所有数据发往这个地址。此选项可用于适配 Shadowsocks Obfs 或 KCPTun 等工具。
* VMess 的“不加密”选项性能优化，与之前版本不兼容。
* 新年快乐！

## 2017.01.16 v2.15

* mKCP 和 WebSocket 现已适用于所有的出站（入站）协议。

## 2017.01.09 v2.14

* Socks 5 出站协议。
* mKCP 新增微信视频通话伪装。

## 2017.01.02 v2.13

* 修复了一些问题。

## 2016.12.26 v2.12

* 修复了一些问题。

## 2016.12.19 v2.11

* JSON 配置文件可以写注释了。

## 2016.12.12 v2.10

* VMess 中增加了 AES-GCM 和 Chacha20-Poly1305 加密方式；

## 2016.12.05 v2.9

* 修复了与 Alpine Linux 的兼容性；

## 2016.11.28 v2.8

* Shadowsocks 服务器端现接受 OTA 设置，可强制开启或关闭 OTA 验证；
* 小修小补；

## 2016.11.21 v2.7

* 现在可以给主入站出站连接设置标识了；
* 一些小修小补；

## 2016.11.14 v2.6

* 可将一个出站协议发出的数据转发至另一出站协议；
* 路由可根据入站协议的标识来进行判断了；

## 2016.11.07 v2.5

* 新增 Shadowsocks 出站协议；
* 新增 TCP 连接中的 HTTP 头部伪装；

## 2016.10.24 v2.4

* 每个入站出站协议可以配置各自的 TCP / mKCP / WebSocket 设置了；
* 路由现可以跟据来源 IP 进行转发；

## 2016.10.17 v2.3

* 重构了配置文件相关的代码，引入了基于 Protobuf 的新格式；
* 增加了 OpenBSD 的二进程文件；
* 小修小补；

## 2016.09.19 v2.2

* 新增了 WebSocket 的载体（感谢 [@xiaokangwang](https://github.com/xiaokangwang)）；

## 2016.09.19 v2.1

* mKCP 性能提升；

## 2016.08.20 v2.0

* 一周年

## 2016.08.15 v1.24

* mKCP 新增了 BT 数据包伪装。
* 入站连接现在可以设置 allowPassive 来允许被动连接，如 IMAP。

## 2016.08.08 v1.23

* 优化了 mKCP 数据包。此版本的 mKCP 与之前版本不兼容，请同时升级客户端和服务器。
* mKCP 现在可以经过配置，伪装成视频通话的数据。

## 2016.08.01 v1.22

* 修复了 mKCP 中一个内存泄漏问题；
* 新增了 FreeBSD 的支持；

## 2016.07.25 v1.21

* 提升了 ChaCha20 的性能（感谢 aead@）；
* 修复了一些问题；

## 2016.07.18 v1.20

* KCP 中新增了 readBufferSize 和 writeBufferSize 选项；
* 修复了一些问题；

## 2016.07.11 v1.19

* 新增了 [TLS 选项](../chapter_02/05_transport.md#分连接配置)，平台支持的所有协议都可以开启 TLS；
* 修复了 KCP 的性能问题；
* 修复了一个可能导致 KCP 中 EOF 响应的问题；

## 2016.07.04 v1.18

* 修复了 KCP 中连接多过的问题；
* 降低了 KCP 对 CPU 的使用；
* 修复了一些其它的问题；

## 2016.06.19 v1.17

* 整合了 KCP（感谢 [xiaokangwang](https://github.com/xiaokangwang)、[xtaci](https://github.com/xtaci)、[skywind3000](https://github.com/skywind3000)）
* 修复了一些小问题

## 2016.06.12 v1.16

* TCP 连接重用默认开启；
* Dokodemo-door 现在可以识别由 iptables 转发的数据了；
* Blackhole 可配置自动发送 HTTP 形式的拒绝数据；

## 2016.06.05 v1.15

* 增加了 TCP 连接重用选项，对于 HTTP 请求的性能有明显的提升；
* 支持监听指定的 IP 地址而非全部；
* 支持从指定的 IP 地址发出数据；
* 修复了 HTTP 代理中一个可能会导致内存耗尽的问题；

## 2016.05.29 v1.14

* 修复了 HTTP 代理中一个可能导致崩溃的问题；
* [安装脚本](../chapter_00/install.md)中增加了一些功能；
* [DNS](../chapter_02/04_dns.md) 中增加了静态路由功能；
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

* Shadowsocks 支持了 ChaCha20 加密方式；
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

## 2016.01.25 v1.5

* 修复了一个 VMess 中的安全性问题，导致了 1.5 和之前版本不兼容，请同时升级你的客户端和服务器端；
* 修复了一个路由不能正常工作的问题；
* [动态端口](../chapter_03/00_dynport.md)；
* 略微提升了性能；

## 2016.01.18 v1.4

* 更新了[安装脚本](../chapter_00/install.md)，在 Debian / Ubuntu / CentOS 7 中可自动安装和更新 V2Ray；
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
