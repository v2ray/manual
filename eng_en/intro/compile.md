# 编译源文件

大概流程，请根据实际情况修改

1. 安装 Git： `sudo apt-get install git -y`
2. 安装 golang：
  1. 下载安装文件：
    1. 64位：`curl -o go_latest.tar.gz -L https://storage.googleapis.com/golang/go1.9.4.linux-amd64.tar.gz`
    2. 32位：`curl -o go_latest.tar.gz -L https://storage.googleapis.com/golang/go1.9.4.linux-386.tar.gz`
  2. `sudo tar -C /usr/local -xzf go_latest.tar.gz`
  3. `export PATH=$PATH:/usr/local/go/bin`
  4. `export GOPATH=$HOME/work`
3. 下载 V2Ray 源文件：`go get -u v2ray.com/core/...`
4. 下载 V2Ray 扩展包：`go get -u v2ray.com/ext/...`
5. `go build -o $GOPATH/bin/v2ray v2ray.com/core/main`
6. `go build -o $GOPATH/bin/v2ctl v2ray.com/ext/tools/control/main`

## Arch Linux

1. 安装 Git： `sudo pacman -S git`
2. 安装 golang：`sudo pacman -S go`
   1. `export GOPATH=$HOME/work`
3. `go get -u v2ray.com/core/...`
4. `go get -u v2ray.com/ext/...`
5. `go build -o $GOPATH/bin/v2ray v2ray.com/core/main`
6. `go build -o $GOPATH/bin/v2ctl v2ray.com/ext/tools/control/main`

## Debian / Ubuntu

`bash <(curl -s https://raw.githubusercontent.com/v2ray/v2ray-core/master/release/install.sh)`

此脚本会自动安装 git 和 golang 1.9 （如果系统上没有的话，并且需要 root 权限），然后把 v2ray 编译到 $GOPATH/bin/v2ray，新装的 golang 会把 GOPATH 设定到 /v2ray。
