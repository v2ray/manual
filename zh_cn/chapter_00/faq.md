---
refcn: chapter_00/faq
refen: welcome/faq
---

# 常见问题

## 一般问题

### 制作 V2Ray 的目的是什么？

对于已公开的合法信息，人民有自由获取的权利。同时，人民也有言论自由的权利。

### 是否反对管制？

不反对管制。事实上任何事物都需要管制，以减少大众的生活成本，比如奶粉。但监管需要有法可依、有据可循。民众都认可的监管方式也是合理的，可接受的。

### Project V 由谁主导开发？

我们是一群爱好自由的人们。由于政策压力，我们倾向于保持匿名，尽可能地不透露任何身份信息。

## V2Ray 使用相关

### V2Ray 如何升级

* 重新下载安装包，或者
* 如果你使用安装脚本进行安装，重新运行安装脚本即可

### V2Ray 闪退

* 如果你使用 Linux 并开启了 systemd，可以使用 `journalctl -u v2ray` 查看 V2Ray 退出时的日志；
* 一般情况可以手动运行 `v2ray -config=<config-file> -test` 来查看错误信息；

### 兼容性保证 {#backward-compatibility}

* 配置文件向后兼容至少一个大版本，即 V2Ray 4.x 可以正常加载 3.x 的配置文件。
* 所有基于 Protobuf 的通信协议，如 Api，向后兼容至少一个大版本。
* 所有基于二进制的通信协议，如 Shadowsocks 和 VMess。当服务器版本不低于客户端版本时，保持永久兼容；当客户端版本超过服务器版本时，保持至少 12 个小版本的兼容性。

## V2Ray 错误信息 {#errors}

### VMess: Invalid User

可能的原因：

1. 客户端和服务器端的用户 ID 不匹配；
1. 客户端和服务器端的用户 alterId 不匹配；
1. 客户端与服务器的时间不匹配，误差不能超过90秒钟；

### Shadowsocks: Unknown address type

可能的原因：

1. Shadowsocks 协议的加密方式或是密码不匹配；

### Socks: Unknown Socks version: 67

可能的原因：

* 你开启的是 Socks 代理，但在浏览器中配置了 HTTP 代理

解决方案：

* 在 V2Ray 中配置一个 HTTP 入站代理，然后把浏览器的设置指向这个代理

## 其它软件错误

### 访问 Google 时，浏览器中显示证书无效

错误信息：攻击者可能会试图从 www.google.com 窃取您的信息（例如：密码、通讯内容或信用卡信息）。了解详情 NET::ERR_CERT_COMMON_NAME_INVALID

原因：你的 DNS 缓存可能已被污染。

解决方案：

* 需要在使用代理的情况下，清空缓存并重新抓取 DNS 数据
* 在 V2Ray 中可使用`sniffing`功能克服一部分 DNS 污染。

## 项目授权 {#licence}

Project V 使用以下方式进行授权

### V2Ray

源代码以官方发布的安装包，使用 MIT 协议授权。包括以下代码仓库中的源代码及安装包：

* [v2ray/v2ray-core](https://www.github.com/v2ray/v2ray-core/)
* [v2ray/ext](https://www.github.com/v2ray/ext)

### 官方网站 {#v2ray-com}

官方网站（[v2ray.com](https://www.v2ray.com/)）以[知识共享署名 4.0 国际许可协议](https://creativecommons.org/licenses/by/4.0/deed.zh)协议授权。

* 包括网站中所有可见的文字内容和图片。
* 包括 <a href="https://www.v2ray.com/resources/v2ray_1024.png" target="_blank">Project V 图标文件</a>。
* 包括生成网站所使用到的源代码，即[v2ray/manual](https://www.github.com/v2ray/manual)。

### 软件截图和其它文件 {#screenshots}

第三方所创作的内容，其版权归其创作者所有。Project V 放弃对这些内容的所有权。

* 包括 Project V 使用过程中的截图。
* 包括运行 Project V 所需的配置文件。
* 包括 Project V 运行时产生的日志文件。

### 其它内容 {#other}

未在上述提及的内容，其版权视具体情况而定。
