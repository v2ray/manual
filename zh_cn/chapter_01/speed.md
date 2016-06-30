# 速度测试

这里介绍一种基于 iPerf 的速度测试方法。

## 安装 iPerf
[iPerf](https://iperf.fr/) 是一个免费软件，支持 Windows、macOS、Linux 等操作系统，可进行两台主机之间的速度测试。在[下载页面]可以下载到各个平台的预编译软件包，解压即可使用。

## 测试主机之间正常 TCP 连接的速度
* 开启服务器端 ```/usr/bin/iperf3 -s```
  * 默认端口为 5201，可使用 -p 参数修改
  * 默认为前台运行，使用 -D 后台运行
* 运行服务器端 ```./iperf3 -c [IP地址]```

运行完成之后可以看到类似如下的输出：
```
Connecting to host [远程IP], port [端口]
[  4] local [本机IP] port [端口] connected to [远程IP] port [端口]
[ ID] Interval           Transfer     Bandwidth
[  4]   0.00-1.00   sec  27.3 MBytes   228 Mbits/sec                  
[  4]   1.00-2.00   sec  26.0 MBytes   218 Mbits/sec                  
[  4]   2.00-3.00   sec  19.2 MBytes   161 Mbits/sec                  
[  4]   3.00-4.00   sec  20.2 MBytes   169 Mbits/sec                  
[  4]   4.00-5.00   sec  19.0 MBytes   159 Mbits/sec                  
[  4]   5.00-6.00   sec  18.7 MBytes   157 Mbits/sec                  
[  4]   6.00-7.00   sec  21.9 MBytes   184 Mbits/sec                  
[  4]   7.00-8.00   sec  22.2 MBytes   186 Mbits/sec                  
[  4]   8.00-9.00   sec  21.2 MBytes   178 Mbits/sec                  
[  4]   9.00-10.00  sec  23.9 MBytes   201 Mbits/sec                  
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth
[  4]   0.00-10.00  sec   220 MBytes   184 Mbits/sec                  sender
[  4]   0.00-10.00  sec   210 MBytes   176 Mbits/sec                  receiver
```
上述输出表示连接速度大约在 20MB 或 150 - 200 Mb 之间。

## 测试 V2Ray 的连接速度
* 在 V2Ray 客户端的配置文件中添加一个 dokodemo-door 的入口，如下：
```javascript
"inboundDetour": [
   "protocol": "dokodemo-door",
   "port": 8888,
   "settings": {
     "address": "[远程主机IP]",
     "port": 5201,
     "network": "tcp,udp"
    }
  }]
```

* 在服务器端启动 iPerf，命令和上面一样
* 在客户端启动 iPerf，并指向本地的 dokodemo-door：```./iperf3 -c 127.0.0.1 -p 8888```

可以看到类似这样的输出，注意 IP 地址：
```
Connecting to host 127.0.0.1, port 8888
[  4] local 127.0.0.1 port 51715 connected to 127.0.0.1 port 8888
[ ID] Interval           Transfer     Bandwidth
[  4]   0.00-1.00   sec  25.3 MBytes   212 Mbits/sec                  
[  4]   1.00-2.00   sec  24.6 MBytes   206 Mbits/sec                  
[  4]   2.00-3.00   sec  24.4 MBytes   205 Mbits/sec                  
[  4]   3.00-4.00   sec  23.0 MBytes   193 Mbits/sec                  
[  4]   4.00-5.00   sec  19.4 MBytes   163 Mbits/sec                  
[  4]   5.00-6.00   sec  15.7 MBytes   132 Mbits/sec                  
[  4]   6.00-7.00   sec  15.6 MBytes   131 Mbits/sec                  
[  4]   7.00-8.00   sec  19.0 MBytes   159 Mbits/sec                  
[  4]   8.00-9.00   sec  19.4 MBytes   162 Mbits/sec                  
[  4]   9.00-10.00  sec  15.5 MBytes   130 Mbits/sec                  
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth
[  4]   0.00-10.00  sec   202 MBytes   169 Mbits/sec                  sender
[  4]   0.00-10.00  sec   192 MBytes   161 Mbits/sec                  receiver
```

## 总结
* iPerf 只适用于固定连接数、短时间的速度测试；
* iPerf 得出的结果要比网站类的速度测试更精确；
