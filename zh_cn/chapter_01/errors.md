# 常见错误信息

## VMess 认证失败
### 错误信息
Invalid authentication
VMessOut: Failed to read VMess response (0 bytes): EOF
VMessOut: Failed to read VMess response (0 bytes): wsarecv: An existing connection was forcibly closed by the remote host.

### 原因
1. 客户端和服务器端的用户 ID 不匹配；
1. 客户端和服务器端的用户 alterId 不匹配；
1. 客户端与服务器的时间不匹配，误差不能超过两分钟；
1. 偶然因素，可忽略；

## Shadowsocks 认证失败
### 错误信息
Shadowsocks: Unknown address type: xxx

### 原因
1. Shadowsocks 协议的加密方式或是密码不匹配；

