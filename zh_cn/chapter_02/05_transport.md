# 底层传输配置

底层传输（transport）配置指定了 V2Ray 如何使用 TCP、UDP 等基础网络协议。配置分为两部分，一是全局设置，二是分协议配置。分协议配置可以指定每个单独的传入传出协议用怎样的方式传输。通常来说客户端和服务器对应的传出传入协议需要使用同样的传输方式。当分协议传输配置指定了一种传输方式，但没有填写其设置时，此传输方式会使用全局配置中的设置。

## 全局配置 {#global}

全局配置位于配置文件的 "transport" 项。

```javascript
{
  "tcpSettings": {},
  "kcpSettings": {},
  "wsSettings": {}
}
```

其中：

* `tcpSettings`: 针对 [TCP 连接的配置](transport/tcp.md)。
* `kcpSettings`: 针对 [mKCP 连接的配置](transport/mkcp.md)。
* `wsSettings`: 针对 [WebSocket 连接的配置](transport/websocket.md)。

## 分协议配置 {#perproxy}

每一个传入、传出连接都可以配置不同的传输配置，在 inbound、inboundDetour、outbound、outboundDetour 的每一项中，都可以设置 streamSettings 来进行一些传输的配置。

```javascript
{
  "network": "tcp",
  "security": "none",
  "tlsSettings": {
    "serverName": "v2ray.com",
    "allowInsecure": false,
    "certificates": [
      {
        "certificateFile": "/path/to/certificate.crt",
        "keyFile": "/path/to/key.key"
      }
    ]
  },
  "tcpSettings": {},
  "kcpSettings": {},
  "wsSettings": {}
}
```

其中：

* `network`: 数据流所使用的网络，可选的值为 `"tcp"`、 `"kcp"` 或 `"ws"`，默认值为 `"tcp"`；
* `security`: 是否启入传输层加密，支持的选项有 `"none"` 表示不加密（默认值），`"tls"` 表示使用 [TLS](https://en.wikipedia.org/wiki/Transport_Layer_Security)。
* `tlsSettings`: TLS 配置。TLS 由 Golang 提供，支持 TLS 1.2，不支持 ChaCha 加密方式，不支持 DTLS。
  * `serverName`: 指定服务器端证书的域名，在连接由 IP 建立时有用。
  * `allowInsecure`: 是否允许不安全连接（用于客户端）。当值为 true 时，V2Ray 不会检查远端主机所提供的 TLS 证书的有效性。
  * `certificates`: 证书列表（用于服务器端），其中每一项表示一个证书：
    * `certificateFile`: 证书文件，如使用 OpenSSL 生成，后缀名为 .crt。
    * `keyFile`: 密钥文件，如使用 OpenSSL 生成，后缀名为 .key。目前暂不支持需要密码的 key 文件。
* `tcpSettings`: 当前连接的 TCP 配置，仅当此连接使用 TCP 时有效。配置内容与上面的全局配置相同。
* `kcpSettings`: 当前连接的 mKCP 配置，仅当此连接使用 mKCP 时有效。配置内容与上面的全局配置相同。
* `wsSettings`: 当前连接的 WebSocket 配置，仅当此连接使用 WebSocket 时有效。配置内容与上面的全局配置相同。
