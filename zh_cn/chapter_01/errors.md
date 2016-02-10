# 常见错误信息

## Invalid authentication
原因：客户端使用了错误的用户 ID。

解决：
* 如果客户端无法正常连接服务器，请检查配置文件中的用户 ID 设置；
* 如果客户端可以正常连接，只是偶尔出现此错误，则说明你的服务器受到流量重放攻击。

## VMessOut: Failed to read VMess response (0 bytes): EOF
原因：
* 客户端使用错误的用户 ID；
* 浏览器使用了 AdBlock 之类拦截广告的插件（在这种情况下，可以忽略上述错误）
