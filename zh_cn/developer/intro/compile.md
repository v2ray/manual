# 配置开发环境

V2Ray 使用 [Golang](https://golang.org/) 作为主要编程语言、[Bazel](https://bazel.build/)作为构建工具。推荐使用 Mac OS 或 Linux 进行开发，少量的脚本可能无法在 Windows 上正常运行。

## 前序工作

* 安装 Golang: [golang.org/doc/install](https://golang.org/doc/install)
* 安装 Bazel: [docs.bazel.build/install](https://docs.bazel.build/versions/master/install.html)

## 拉取 V2Ray 源代码

```go
go get -u v2ray.com/core/...
go get -u v2ray.com/ext/...
```

## 自动构建

如果只需要构建某个特定平台的安装包，如 Linux / AMD64:

```bash
cd $GOPATH/src/v2ray.com/core
bazel build --action_env=GOPATH=$GOPATH --action_env=PATH=$PATH//release:v2ray_linux_amd64_package
#Output: bazel-bin/release/v2ray-linux-64.zip
```

构建所有安装包:

```bash
cd $GOPATH/src/v2ray.com/core
bazel build --action_env=GOPATH=$GOPATH --action_env=PATH=$PATH//release:all
```

## 安装构建完成的安装包

```bash
$GOPATH/src/v2ray.com/core/release/install-release.sh --local <path/to/zip/file>
```
