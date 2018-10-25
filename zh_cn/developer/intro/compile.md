# 配置开发环境

V2Ray 使用 [Golang](https://golang.org/) 作为主要编程语言、[Bazel](https://bazel.build/)作为构建工具。推荐使用 Mac OS 或 Linux 进行开发，少量的脚本可能无法在 Windows 上正常运行。

## 前序工作 {#prerequisite}

* 安装 Golang: [golang.org/doc/install](https://golang.org/doc/install)
* 安装 Bazel: [docs.bazel.build/install](https://docs.bazel.build/versions/master/install.html)

## 拉取 V2Ray 源代码 {#pull}

```go
go get -u v2ray.com/core/...
go get -u v2ray.com/ext/...
```

## 自动构建 {#build}

如果只需要构建某个特定平台的安装包，如 Linux / AMD64:

```bash
cd $GOPATH/src/v2ray.com/core
bazel build --action_env=GOPATH=$GOPATH --action_env=PATH=$PATH //release:v2ray_linux_amd64_package
#Output: bazel-bin/release/v2ray-linux-64.zip
```

构建所有安装包:

```bash
cd $GOPATH/src/v2ray.com/core
bazel build --action_env=GOPATH=$GOPATH --action_env=PATH=$PATH //release:all
```

## 安装构建完成的安装包 {#install}

```bash
$GOPATH/src/v2ray.com/core/release/install-release.sh --local <path/to/zip/file>
```

## 自动化从源代码构建 {#auto-build}

某些场景可能需要从源代码构建，而不能直接下载安装包，比如制作一个安装源的时候。以下提供一个简单的自动构建方法: 

1. 安装 Golang 和 Bazel，并设置 GOPATH。
2. 下载完整的源代码: `curl -L -O https://github.com/v2ray/v2ray-core/releases/latest/src_all.zip`。这个压缩包从 3.46.4 开始提供，包含了编译 V2Ray 所需的所有代码。
3. 解压: `unzip -d $GOPATH/src/ src_all.zip`
4. 构建:

```bash
cd $GOPATH/src/v2ray.com/core
bazel build --action_env=GOPATH=$GOPATH --action_env=PATH=$PATH //release:v2ray_linux_amd64_package
```

5. 然后可以解压安装包并重新打包: `unzip bazel-bin/release/v2ray-linux-64.zip`
