# 服务器配置

本文仅描述 Linux 中的 V2Ray 服务器配置，如果你在 Windows 和 Mac OS X 桌面系统上使用 V2Ray，请参考 [客户端配置](02_client.md)。

## 修改配置文件
### 文件位置：
在 V2Ray 的官方发行版中包含了两个配置文件：
* [vpoint_socks_vmess.json](https://github.com/v2ray/v2ray-core/blob/master/release/config/vpoint_socks_vmess.json)：包含了 V2Ray 客户端的默认配置；
* [vpoint_vmess_freedom.json](https://github.com/v2ray/v2ray-core/blob/master/release/config/vpoint_vmess_freedom.json)：包含了 V2Ray 服务器的默认配置。

两个文件的格式大体相同，配置服务器请基于 vpoint\_vmess\_freedom.json 文件进行修改：

```javascript
{
  "port": 27183, // 监听端口，必须和 Server A （客户端）中指定的一致
  "log" : {
    "access": "access.log" // 访问记录
  },
  "inbound": {
    "protocol": "vmess", // 中继协议，不用改
    "settings": {
      "clients": [
          // 认可的用户 ID，必须包含 Server A （客户端）中的用户 ID
        {"id": "ad937d9d-6e23-4a5a-ba23-bce5092a7c51"}
      ]
    }
  },
  "outbound": {
    "protocol": "freedom", // 出口协议，不用改
    "settings": {} // 暂无配置
  }
}
```

### 注意事项
* V2Ray 的用户验证基于时间，请确保 A 和 B 所在机器的系统时间误差在一分钟以内。
* json 配置文件实际上不支持注释（即“//”之后的部分，在使用时请务必删去）。

## 运行

./server --config="vpoint_vmess_freedom.json 的绝对路径"

## 调试

使用过程中遇到任何问题，请参考[常见错误信息](04_errors.md)。
