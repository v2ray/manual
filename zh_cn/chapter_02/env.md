# 环境变量

V2Ray 提供以下环境变量以供修改 V2Ray 的一些底层配置。以下所有的环境变量名称中，`.` 都可以被替换为 `_`，即 `v2ray_location_asset` 等价于 `v2ray.location.asset`。

## 每个连接的缓存大小

* 名称：`v2ray.ray.buffer.size`
* 单位：MBytes
* 默认值：10
* 特殊值：0 表示缓存无上限

对于一个代理连接，当上下游网络速度有差距时，V2Ray 会缓存一部分数据，以减小对网络传输的影响。这个配置设置了缓存的大小，越大的缓存会占用更多的内存，也会使网络性能越好。

## 资源文件路径

* 名称：`v2ray.location.asset`
* 默认值：和 v2ray 文件同路径

这个环境变量指定了一个文件夹位置，这个文件夹应当包含 geoip.dat 和 geosite.dat 文件。

## 配置文件位置 (V2Ray 3.1+)

* 名称：`v2ray.location.config`
* 默认值：和 v2ray 文件同路径

这个环境变量指定了一个文件夹位置，这个文件夹应当包含 config.json 文件。
