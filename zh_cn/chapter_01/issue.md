# Issue 指引

在报告问题之前请先阅读下面的内容，以提高问题的质量和解决效率。

## 语言
V2Ray 团队支持中文和英文，请选择你所熟悉的语言来提问，以避免一些不必要的误会。管理员会以问题发起者使用的语言来回复；如果提问者使用了其它的语言，则以英文回复。

## 渠道
所有官方认可的聊天室和群组都可以用于汇报问题，包括 Github 的 Issue。由于工作量的原因，不同的渠道有响应速度不同。优先级如下：

1. [Github Issue](https://github.com/v2ray/v2ray-core/issues);
2. [Gitter 聊天室](gitter.im/v2ray/v2ray-core)
3. [Telegram 群组](https://telegram.me/projectv2ray)
4. 其它

## 问题的组织
问题的内容请包含下面几个方面，以方便重现：
* 问题描述：任何的错误信息，不正常的行为等
* 操作系统：如 Windows 10，Ubuntu 14.04 等，64 位 / 32 位
* V2Ray 版本：版本号或源码同步日期
* Golang 版本：如果有的话
* 日志文件：如果有的话
* 上下文：之前运行过什么命令／程序，安装过什么其它软件等
* Journal：如果你使用 Systemd，可以使用 ```journalctl -u v2ray``` 命令来获得最近的 V2Ray panic 的信息

其中问题描述请尽量精确，请勿包含任何有歧义的形容词。

一些有效的提问举例：
* [#138](https://github.com/v2ray/v2ray-core/issues/138)
* [#132](https://github.com/v2ray/v2ray-core/issues/132)

以下不清晰的提问将被直接忽略：
* “V2Ray 占用内存很大”
  * 请说明具体数值；
* “这几天速度似乎慢了”
  * 请说明之前有多快，现在有多慢，这几天发生了什么，等等；

## Github Issue 分类

### Bug
代码的质量问题，可以是功能性（Functionality），稳定性（Reliability）或者性能（Performance）。

请在一个 Issue 中只描述一个问题，如果你遇到多个问题，请分别创建不同的 Issue，以方便讨论和解决。如果合在一起发，将有很高的机率被标记为 Chat 而降低解决问题的优先级。

### Chat
聊天或其它相关性不强的内容。标记为 Chat 的 Issue 将在最后回复 7 天后关闭。

### Enhancement
有关新特性的建议，如果是针对现有代码的修改，请详细描述您的建议。

### Duplicate
此 Issue 与之前的某一个 Issue 重复。

### Help Wanted
标记为 Help Wanted 的 Issue 接受 Pull Request，一般为新特性的实现，如果您对其中某一个感兴趣，欢迎供献代码。

### Invalid
无法重现的 Bug 或没有意义的 Issue。

### Won't fix
此 Issue 是一个合理的问题，但不影响软件的正常使用，故不修复。
