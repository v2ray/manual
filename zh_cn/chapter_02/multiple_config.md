---
refcn: chapter_02/mux
---

## 多文件配置

自版本`4.23.0`起，v2ray程序支持多配置文件。

多配置文件的主要作用在于，在庞大的json配置中，分散不同作用模块配置，便于管理和维护。该功能主要考虑是为了丰富v2ray生态链。比如对于V2ray GUI的客户端，一般只实现节点选择等固定的功能，对于复杂的配置难以图形化实现，使用多配置后，只需留一个`confdir`的自定义目录，用户既可以享受GUI的便捷，也可以撰写复杂的高级配置。


### 用法

命令行的`-config`可以多次指定。（也可以简写为`-c`，完全等效。）

```
./v2ray -config base.json -config cf1.json -c cf2.json -c cf3.json
```

或者用`-confdir`参数指定一个目录，程序会按文件名顺序读取目录内的`.json`文件。

```
./v2ray -confdir /etc/v2ray/confs
```

也可组合使用。（注意，目录内的配置级别作用在`-config`参数后，不管`-confdir`参数的位置）

```
./v2ray -c cf1.json -c cf2.json -confdir /etc/v2ray/confs 
```

也可使用[环境变量](chapter_02/env.md#confdir)`v2ray.location.confdir`或`V2RAY_LOCATION_CONFDIR`指定`confdir`。

### 作用规则

#### 普通对象（`{}`）

** 在json的顶级对象当中，后者覆盖或补充前者。**

比如：

* base.json
```json
{
    "log": {},
    "api": {},
    "dns": {},
    "stats": {},
    "policy": {},
    "transport": {},
    "routing": {},
    "inbounds": []
}
```

* outbounds.json
```json
{
    "outbounds": []
}
```

以多配置启动v2ray: `./v2ray -c base.json -c outbounds.json`，这两个配置文件的就等效于合成一起的整配置。当需要修改出口节点，只需要修改`outbounds.json`内容。

如果需要改编日志log的级别，也不需要改`base.json`，后续加一个配置：

* debuglog.json
```json
{
    "log":{"loglevel": "debug"}
}
```

启动时放置在base后，即可输出debug级别的日志：

`./v2ray -c base.json -c outbounds.json -c debuglog.json`


#### 数组（`[]`）

在json配置中的`inbounds`和`outbounds`是数组结构，他们有特殊的规则：

* 当配置中的数组元素有2或以上，覆盖前者的inbounds/oubounds；
* 当配置中的数组元素只有1个时，查找原有`tag`相同的元素进行覆盖；若无法找到：
  - 对于inbounds，添加至最后（inbounds内元素顺序无关）
  - 对于outbounds，添加至最前（outbounds默认首选出口）；但如果文件名含有tail(大小写均可)，添加至最后。

借助多配置，可以很方便为原有的配置添加不同协议的inbound，而不必修改原有配置。

比如：

* 000.json
```json
{
    "inbounds": [
      {
        "protocol": "socks",
        "tag":"socks",
        "port": 1234
      }
    ]
}
```

* 001.json
```json
{
    "inbounds": [
      {
        "tag":"http"
      }
    ]
}
```

* 002.json
```json
{
    "inbounds": [
      {
        "protocol": "socks",
        "tag":"socks",
        "port": 4321
      }
    ]
}
```

三个配置将会合成为：
```json
{
    "inbounds": [
      {
        "protocol": "socks",
        "tag":"socks",
        "port": 4321 // <--- 002顺序在000后，因此覆盖tag为socks的inbound端口为4321
      },
      {
        "tag":"http"
      }
    ]
}
```