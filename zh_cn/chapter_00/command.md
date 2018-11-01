---
refcn: chapter_00/command
refen: welcome/command
---

# 命令行参数

## V2Ray

V2Ray 的程序文件的命令行参数如下：

```bash
v2ray [-version] [-test] [-config=config.json] [-format=json]
```

> `-version`

只输出当前版本然后退出，不运行 V2Ray 主程序。

> `-test`

测试配置文件有效性，如果有问题则输出错误信息，不运行 V2Ray 主程序。

> `-config`

配置文件路径，可选的形式如下:

* 本地路径，可以是一个绝对路径，或者相对路径。
* `"stdin:"`: 表示将从标准输入读取配置文件内容，调用者必须在输入完毕后关闭标准输入流。
* 以`http://`或`https://`(均为小写)开头: V2Ray 将尝试从这个远程地址加载配置文件。

> `-format`

配置文件格式，可选的值有：

* `json`: JSON 格式；
* `pb` 或 `protobuf`: Protobuf 格式；

{% hint style='info' %}
当`-config`没有指定时，V2Ray 将先后尝试从以下路径加载`config.json`:

* 工作目录（Working Directory）
* [环境变量](../chapter_02/env.md)中`v2ray.location.asset`所指定的路径

{% endhint %}

## V2Ctl

V2Ctl 命令行参数如下：

```bash
v2ctl <command> <options>
```

> `command`

子命令，有以下选项:

* `verify`: 验证文件是否由 Project V 官方签名。
* `config`: 从标准输入读取 JSON 格式的配置，然后从标准输出打印 Protobuf 格式的配置。
* `uuid`: 输出一个随机的 UUID。

### Verify

`v2ctl verify [--sig=/path/to/sigfile] <filepath>`

此命令用于验证一个文件是否由 Project V 官方签名。

> `-sig`

签名文件路径，默认值为待验证文件加入'.sig'后缀。

> `filepath`

待验证文件路径。
