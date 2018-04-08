# 命令行参数

## V2Ray

V2Ray 的程序文件的命令行参数如下：

```shell
v2ray [-version] [-test] [-config=config.json] [-format=json]
```

其中：

* `-version`: 只输出当前版本然后退出，不运行 V2Ray 主程序。
* `-test`: 测试配置文件有效性，如果有问题则输出错误信息，不运行 V2Ray 主程序。
* `-config`:
  * 配置文件的路径；
  * 当值为`stdin:`时，将从标准输入读取配置文件内容，调用者必须在输入完毕后关闭标准输入流。
  * (3.17+) 当其值以`http://`或`https://`(均为小写)开头时，V2Ray 将尝试从这个远程地址加载配置文件。
  * 当值为空时，V2Ray 将先后尝试从当前路径（Working Directory）和环境变量`v2ray.location.asset`所指定的路径中加载配置文件。
* `-format`: 配置文件格式，可选的值有：
  * `json`: JSON 格式；
  * `pb` 或 `protobuf`: Protobuf 格式；

## V2Ctl

V2Ctl 命令行参数如下：

```shell
v2ctl <command> <options>
```

可使用的 command 如下，每个 command 有各自不同的 options。

### Verify

`v2ctl verify [--sig=/path/to/sigfile] /file/to/verify`

此命令用于验证一个文件是否由 Project V 官方签名。

参数：

* `sig`：签名文件路径，默认值为待验证文件加入'.sig'后缀。
* 第一参数：待验证文件路径。

### Config

`v2ctl config`

此命令没有参数，它从标准输入读取 JSON 格式的配置，然后从标准输出打印 Protobuf 格式的配置。