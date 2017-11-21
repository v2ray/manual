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
  * 默认格式为配置文件的路径，默认值是 config.json；
  * 当值为`stdin:`时，将从标准输入读取配置文件内容，调用者必须在输入完毕后关闭标准输入流。
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

### Config

`v2ray config`