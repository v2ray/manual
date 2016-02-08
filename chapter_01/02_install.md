# 下载安装

V2Ray 对于常见操作系统发布了一系列的预编译程序，直接下载即可使用，无须从源代码重新编译。预编译程序发布于 [Release](https://github.com/v2ray/v2ray-core/releases) 中，每周更新，[[更新周期见此|开发计划]]。

支持的平台如下：
* Windows: Vista 及之后版本，32 位和 64 位；
* Mac OS X: 10.7 (Lion) 及之后版本，64位；
* Linux：Kernel 2.6.23 及之后版本，如 Debian 7+， Ubuntu 12.04+，CentOS 6+ 等。

## Windows / Mac OS X
下载上述的发行包，解压即可使用。

## Linux
V2Ray 提供了一个安装脚本用于在 Linux 环境的安装和配置。这个脚本会自动检测有没有安装过 V2Ray，如果没有，则进行完整的配置；如果之前安装过 V2Ray，则只更新 V2Ray 二进制程序而不更新配置。

以下指令假设已在 su 环境下，如果不是，请先运行 sudo su。

运行下面的指令下载并安装 V2Ray。当 yum 或 apt-get 可用的情况下，此脚本会自动安装 unzip 和 daemon。这两个组件是安装 V2Ray 的必要组件。如果你使用的系统不支持 yum 或 apt-get，请自行安装 unzip 和 daemon
```bash
bash <(curl -L -s https://raw.githubusercontent.com/v2ray/v2ray-core/master/release/install-release.sh)
```
 
此脚本会自动安装以下文件：
* /usr/bin/v2ray/v2ray：V2Ray 程序；
* /etc/v2ray/config.json：配置文件；

此脚本会配置自动运行脚本。自动运行脚本目前仅适用于 SysV 模式，不支持 Debian 7 的 systemd。

脚本运行完成后，你需要：

1. 编辑 /etc/v2ray/config.json 文件来配置你需要的代理方式；
1. 运行 service v2ray start 来启动 V2Ray 进程；
1. 之后可以使用 service v2ray start|stop|status|reload|restart|force-reload 控制 V2Ray 的运行。