# 配置文件格式
V2Ray 的配置文件形式如下，客户端和服务器通用一种形式，只是实际的配置不一样。

```javascript
{
  "port": 1080,
  "log": {},
  "routing": {},
  "inbound": {},
  "outbound": {},
  "inboundDetour": {},
  "outboundDetour": {}
}
```

其中：
* port: V2Ray 进程的主端口，它的取值是一个正整数，可以根据实际情况选取；
* log: 日志配置，见下文；
* routing: 路由配置，见下文；
* inbound: 传入连接配置，见下文；
* outbound: 传出连接配置，见下文；
* inboundDetour: 额外的传入连接配置，见下文；
* outboundDetour: 额外的传出连接配置，见下文。
 
## 日志配置（log）
```javascript
{
  "access": "文件地址",
  "error": "文件地址",
  "loglevel": "warning"
}
```

其中：
* access: 访问日志的文件地址，比如 /tmp/v2ray\_access.log （Linux）或者 C:\Temp\v2ray\_access.log（Windows）。
* error: 错误日志的文件地址，比如 /tmp/v2ray\_error.log （Linux）或者 C:\Temp\v2ray\_error.log（Windows）。
* logleve: 错误日志的级别，可选的值为 debug、info、warning 和 error。其中 debug 记录的数据最多，error 记录的最少。默认值为 warning。

## 路由配置（routing）
```javascript
{
  "strategy": "rules",
  "settings": {
    "rules": [
      {
        "type": "field",
        "domain": [
          "baidu.com",
          "qq.com"
        ],
        "outboundTag": "direct"
      },
      {
        "type": "field",
        "ip": "0.0.0.0/8",
        "outboundTag": "direct"
      },
      {
        "type": "field",
        "network": "udp",
        "outboundTag": "blocked"
      }
    ]
  }
}
```
其中：
* strategy: 路由模式，目前只有"rules"一个值；
* settings: 具体内容详见[[路由配置]]；


## 传入和传出连接配置（inbound / outbound）
传入和传出的连接配置形式一样，只是所用到的具体协议及详细配置不同，可用的协议请见[[协议列表]]。

```javascript
{
  "protocol": "连接协议",
  "settings": {}
}
```

其中：
* protocol: 连接协议名称，可选的值见[[协议列表]]。
* settings: 具体的配置内容，视协议不同而不同。

## 额外的传入连接配置（inbound detour）
此项是一个数组，可包含多个连接配置，每一个配置形如：
```javascript
{
  "protocol": "协议名称",
  "port": "端口",
  "tag": "标识",
  "allocate": {
    "strategy": "always",
    "refresh": 5,
    "concurrency": 3
  },
  "settings": {}
}
```

其中：
* protocol: 连接协议名称，可选的值见[[协议列表]]。
* port: 端口号，可以是一个数值，或者字符串形式的数值范围，比如 "5-10" 表示端口 5 到端口 10 这 6 个端口。
* tag (V2Ray 1.5+): 此传入连接的标识，用于在其它的配置中定位此连接。属性值必须在所有 tag 中唯一。
* allocate (V2Ray 1.5+): 分配设置：
  * strategy: 分配策略，可选的值有 always 和 random 两个。always 表示总是分配所有已指定的端口，port 是指定了多少个端口，V2Ray 就会监听这些端口。random 表示随机开放端口，每隔 refresh 分钟在 port 范围中随机选取 concurrency 个端口来监听。
  * refresh: 随机端口刷新间隔，单位为分钟。最小值为 2，建议值为 5。这个属性仅当 strategy = random 时有效。
  * concurrency: 随机端口数量。最小值为 1，最大值为 port 范围的一半。建议值为 3。
* settings: 具体的配置内容，视协议不同而不同。

### 额外的传出连接配置（outbound detour）
此项是一个数组，可包含多个连接配置，每一个配置形如：
```javascript
{
  "protocol": "协议名称",
  "tag": "标识",
  "settings": {}
}
```

其中：
* protocol: 连接协议名称，可选的值见[[协议列表]]；
* tag: 当前的配置标识，当路由选择了此标识后，数据包会由此连接发出；
* settings: 具体的配置内容，视协议不同而不同。