# V2Ray 用户手册

欢迎使用 V2Ray 来连接世界的另一端。

* 语言: [![Chinese](resources/chinese.svg)](https://www.v2ray.com/) [![English](resources/english.svg)](https://www.v2ray.com/en/)
* 下载: [![GitHub release](resources/github-release.svg)](https://github.com/v2ray/v2ray-core/releases/latest) [![BT Sync](/resources/btsync.svg)](https://link.getsync.com/#f=v2ray&sz=19E6&t=1&s=6FLYZURKW4ZI5SIE55VJXTLNAMTMILCL&i=CER544EIJKHBENRLTK6JZ4X32OTPZDTQV&v=2.3)
* 联系: [![Telegram](resources/telegram.svg)](https://telegram.me/projectv2ray) [![Twitter](resources/twitter.svg)](https://twitter.com/projectv2ray) [![Gitter](resources/gitter.svg)](https://gitter.im/v2ray/v2ray-core) [![Google+](resources/gplus.svg)](https://plus.google.com/communities/118329549804626583700) [![Email](resources/email.svg)](mailto:love@v2ray.com) [![PGP 公钥](resources/pgp.svg)](chapter_00/pgp.md)

## 主要特性
### 多协议支持
V2Ray 原生支持 Socks、HTTP、Shadowsocks、VMess 等协议。

* 在一个进程中可以配置不同的端口使用不同的协议进行通讯。
* 通过不同的传入和传出协议组合，灵活转换通讯格式。

### 可变传输载体
上述协议均可使用 TLS、TCP、mKCP 等传输方式进行传输。

### 灵活的路由
通过内置的路由功能，V2Ray 可以灵活地实现选择性转发、直连或是阻止部分连接。

### 多平台支持
V2Ray 在以下平台中可用：
* Windows Vista 及之后版本（x86 / amd64）；
* Mac OS X 10.7 及之后版本（amd64）；
* Linux 2.6.23 及之后版本（x86 / amd64 / arm / arm64 / mips64）；
  * 包括但不限于 Debian 7 / 8、Ubuntu 12.04 / 14.04 及后续版本、CentOS 6 / 7、Arch Linux；
* FreeBSD (x86 / amd64)；

## 更新本站点
本站点由 GitBook 生成，并托管于 GitHub。如需修改本站的内容，请向[这个 Repo](https://github.com/v2ray/manual) 提交 Pull Request。
