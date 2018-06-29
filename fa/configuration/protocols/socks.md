# Socks

![English](../../resources/englishc.svg) [![Chinese](../../resources/chinese.svg)](https://www.v2ray.com/chapter_02/protocols/socks.html)

Socks is an implementation of standard SOCKS protocol, compatible with [Socks 4](http://ftp.icm.edu.pl/packages/socks/socks4/SOCKS4.protocol), Socks 4a and [Socks 5](http://ftp.icm.edu.pl/packages/socks/socks4/SOCKS4.protocol).

* Name: socks
* Type: Inbound / Outbound

## Outbound Proxy Configuration

```javascript
{
  "servers": [{
    "address": "127.0.0.1",
    "port": 1234,
    "users": [
      {
        "user": "test user",
        "pass": "test pass",
        "level": 0
      }
    ]
  }]
}
```

Where:

* `servers`: Socks server list, in which each entry has: 
  * `address`: Server address
  * `port`: Server port
  * `users`: List of user accounts: 
    * `user`: Username
    * `pass`: Password
    * `level`: User level.

Notice:

* When user list is not empty, socks will performance user authentication with remote server, using a random user.
* Only supports SOCKS5 servers.

## Inbound Proxy Configuration

```javascript
{
  "auth": "noauth",
  "accounts": [
    {
      "user": "my-username",
      "pass": "my-password"
    }
  ],
  "udp": false,
  "ip": "127.0.0.1",
  "userLevel": 0
}
```

Where:

* `auth`: Socks authentication method. Default to `"noauth"`. Options are: 
  * `"noauth"`: Anonymous.
  * `"password"`: User and password [RFC 1929](https://tools.ietf.org/html/rfc1929)
* `accounts`: An array where each entry is contains `user` for username and `pass` for password. Default to empty. 
  * Only works when `auth` is `"password"`
* `udp`: `true` or `false` to enable UDP. Default to false.
* `ip`: When UDP is enabled, this IP address receives UDP packets from client. Default to `"127.0.0.1"`.
* `userLevel`: User level. All connections share this level.