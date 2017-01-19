# 开发指引

## 基本

### 版本控制

Git

### 分支（Branch）

本项目只使用一个分支，即 master。所有更改全部提交进 master，并确保 master 在任一时刻都是可编译可使用的。

### 发布（Release）

尽量使用自动化工具发布，比如 v2ray-core 使用 Travis-ci 作为自动编译和发布工具。

### 引用其它项目

* Golang
  * 产品代码只能使用 golang 的标准库，即名称不包含任何网址的包；
  * 测试代码可以使用 golang.org/x/... ；
  * 如需引用其它项目请事先创建 Issue 讨论；
* 其它
  * 只要不违反双方的协议（本项目为 MIT），且对项目有帮助的工具，都可以使用。

## 开发流程

### 写代码之前

发现任何问题，或对项目有任何想法，请立即[创建 Issue](../chapter_01/issue.md) 讨论之，以减少重复劳动和消耗在代码上的时间。

### 修改代码

* Golang
  * 请参考 [Effective Go](https://golang.org/doc/effective_go.html)；
  * 每一次 commit 之前请运行： gofmt -w v2ray.com/core/
  * 每一次 commit 之前请确保测试通过： go test v2ray.com/core/...
  * 提交 PR 之前请确保新增代码有超过 70% 的代码覆盖率（code coverage）。
* 其它
  * 请注意代码的可读性

### Pull Request

* 提交 PR 之前请先运行 git pull 以确保 merge 可顺利进行；
* 一个 PR 只做一件事，如有对多个 bug 的修复，请对每一个 bug 提交一个 PR；
* 由于 Golang 的特殊需求（Package path），Go 项目的 PR 流程和其它项目有所不同：
  1. 先 Fork 本项目，创建你自己的 github.com/your/v2ray-core；
  1. 在你的 Go workspace 中运行：`go get -u v2ray.com/core/...`；
  1. 在 go get 创建的 v2ray-core 目录中运行：`git remote add fork https://github.com/you/cooltool.git`；
  1. 然后你可以在 v2ray-core 中修改代码，由于这是一个 v2ray 的 clone，import path 不受影响；
  1. 修改完成之后，运行：`git push fork`；
  1. 然后去你的 fork（就是 v2ray.com/core）中发一个 PR 即可；
  1. 以上内容修改自[这篇文章](http://blog.campoy.cat/2014/03/github-and-go-forking-pull-requests-and.html)。

### 对代码的修改

#### 功能性问题

请提交至少一个测试用例（test case）来验证对现有功能的改动。

#### 性能相关

请提交必要的测试数据来证明现有代码的性能缺陷，或是新增代码的性能提升。

#### 新功能

* 如果新增功能对已有功能不影响，请提供可以开启/关闭的开关（如 flag），并使新功能保持默认关闭的状态；
* 大型新功能（比如增加一个新的协议）开发之前，请先提交一个 issue，讨论完毕之后再进行开发。

#### 其它

视具体情况而定。

## V2Ray 编码规范

以下内容适用于 V2Ray 中的 Golang 代码。

### 代码结构

```text
v2ray-core
├── app        // 应用模块
│   ├── router // 路由
├── common     // 公用代码
├── proxy      // 通讯协议，参见[协议列表](../chapter_02/02_protocols.md)
│   ├── blackhole
│   ├── dokodemo-door
│   ├── freedom
│   ├── socks
│   ├── vmess
├── transport  // 传输模块
```

### 编码规范

基本和 Golang 的官方推荐做法基本一致，有一些例外。写在这里以方便大家熟悉 Golang。

#### 命名

* 文件和目录名尽量使用单个英文单词，比如 hello.go；
  * 如果实在没办法，则目录使用连接线／文件名使用下划线连接两个（或多个单词），比如 hello-world/hello_again.go；
  * 测试代码使用 _test.go 结尾；
* 类型使用 Pascal 命名法，比如 ConnectionHandler；
  * 对缩写不强制小写，即 HTML 不必写成 Html；
* 公开成员变量也使用 Pascal 命名法；
* 私有成员变量使用[小驼峰式命名法](https://zh.wikipedia.org/wiki/%E9%A7%9D%E5%B3%B0%E5%BC%8F%E5%A4%A7%E5%B0%8F%E5%AF%AB)，如 privateAttribute；
* 为了方便重构，方法建议全部使用 Pascal 命名法；
  * 尽管 Golang 中的以大小写区分公开和私有方法，但在实际操作中并不方便。
  * 完全私有的类型放入 internal。

#### 内容组织

* 一个文件包含一个主要类型，及其相关的私有函数等；
* 测试相关的文件，如 Mock 等工具类，放入 testing 子目录；

#### 与 Golang 官方建议冲突的地方

* Golang 不建议使用 this、self 等变量名作为 Receiver Name；V2Ray 中不作强制，可用可不用。
* Golang 不建议使用单元测试（Unit Test）库，比如其它语言中常见的 assertEquals() 函数等；V2Ray 中为了节省时间，制作了一些常用函数来简化单元测试的开发，参见 v2ray-core/testing/assert 包。
