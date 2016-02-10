# 服务器配置

本文仅描述 Linux 中的 V2Ray 服务器配置，如果你在 Windows 和 Mac OS X 桌面系统上使用 V2Ray，请参考 [客户端配置](client.md)。

## 下载程序文件
根据[下载安装](install.md)中的步骤下载 V2Ray 的程序文件。直接下载的话，文件是一个 zip 压缩包。

解压后可以看到三个文件：
* 程序文件：v2ray
* 配置文件：vpoint_socks_vmess.json 和 vpoint_vmess_freedom.json

如果通过脚本安装，v2ray 会被复制到 /usr/bin/v2ray/ 目录下，vpoint_vmess_freedom.json 会被复制到 /etc/v2ray/ 目录下并命名为 config.json。

## 运行

* 手动运行：/usr/bin/v2ray/v2ray --config=/etc/v2ray/config.json
* 自动运行：安装脚本会以 systemv 或是 systemd 的形式设置开机自动运行。

## 修改配置文件
如果你想使用自己的 VPS 或者第三方的服务，可以参考[常用配置](../chapter_05/00_config/README.md)来修改配置文件。

## 调试

使用过程中遇到任何问题，请参考[常见错误信息](errors.md)。
