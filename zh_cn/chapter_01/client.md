# 客户端配置

本文仅描述 Windows 和 Mac OS X 中的 V2Ray 客户端配置，如果你在 Linux 桌面系统上使用 V2Ray，请参考 [服务器配置](server.md)。

## 下载程序文件
根据[下载安装](install.md)中的步骤下载 V2Ray 的程序文件。文件是一个 zip 压缩包，解压即可使用，无需安装。

解压后可以看到两个文件：
* 程序文件：v2ray.exe (Windows) / v2ray (Mac OS X)
* 配置文件：config.json

## 运行

1. 在 Windows 中直接双击 v2ray.exe 即可；
1. 在 Mac OS X 中，右键单击 v2ray 文件，选择“Open With” -> “Terminal.app”

## 修改配置文件
如果你想使用自己的 VPS 或者第三方的服务，可以参考[常用配置](../chapter_05/00_config/README.md)来修改配置文件。

### 注意事项
* V2Ray 的用户验证基于时间，请确保 A 和 B 所在机器的系统时间误差在一分钟以内。
* json 配置文件实际上不支持注释（即“//”之后的部分，在使用时请务必删去）。

## 测试服务器可用性

curl -v --socks5-hostname 127.0.0.1:1080 https://www.google.com/

## 调试

使用过程中遇到任何问题，请参考[常见错误信息](errors.md)。