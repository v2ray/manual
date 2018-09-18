# VMess

[![English][1]][2] [![Chinese][3]][4] [![German][5]][6] [![Russian][7]][8]

[1]: ../../resources/english.svg
[2]: https://www.v2ray.com/en/configuration/protocols/vmess.html
[3]: ../../resources/chinese.svg
[4]: https://www.v2ray.com/chapter_02/protocols/vmess.html
[5]: ../../resources/german.svg
[6]: https://www.v2ray.com/de/configuration/protocols/vmess.html
[7]: ../../resources/russian.svg
[8]: https://www.v2ray.com/ru/configuration/protocols/vmess.html

[VMess](https://www.v2ray.com/eng/protocols/vmess.html) is a protocol for encrypted communications. It includes both inbound and outbound proxy.

* Name: vmess
* Type: Inbound / Outbound

## Outbound Proxy Configuration

```javascript
{
  "vnext": [
    {
      "address": "127.0.0.1",
      "port": 37192,
      "users": [
        {
          "id": "27848739-7e62-4138-9fd3-098a63964b6b",
          "alterId": 10,
          "security": "aes-128-cfb",
          "level": 0
        }
      ]
    }
  ]
}
```

Where:

* `vnext`: An array, where each entry is a remote server
  * `address`: Server address, may be IPv4, IPv6 or domain name.
  * `port`: Server port
  * `users`: An array where each entry is an VMess user
    * `id`: User ID, in the form of a [UUID](https://en.wikipedia.org/wiki/Universally_unique_identifier).
    * `alterId`: Number of alternative IDs. The alternative IDs will be generated in a deterministic way. Default to 0. Maximum 65535. Recommend 32. Its value must be not larger than the one in corresponding Inbound.
    * `level`: User level. See [Policy](../policy.md) for more detail.
    * `security`: Encryption method. Options are:
      * `"aes-128-gcm"`: Recommended for PC.
      * `"chacha20-poly1305"`: Recommended for mobile.
      * `"auto"`: Default value. Use `aes-128-gcm` on AMD64, ARM64 and S390x, or `chacha20-poly1305` otherwise.
      * `"none"`: Traffic is not encrypted at all.

## Inbound Proxy Configuration

```javascript
{
  "clients": [
    {
      "id": "27848739-7e62-4138-9fd3-098a63964b6b",
      "level": 0,
      "alterId": 100,
      "email": "love@v2ray.com"
    }
  ],
  "default": {
    "level": 0,
    "alterId": 32
  },
  "detour": {
    "to": "tag_to_detour"
  },
  "disableInsecureEncryption": false
}
```

Where:

* `clients`: An array for valid user accounts. May be empty when used for dynamic port feature.
  * Each client contains:
    * `id`: User ID, in the form of [UUID](https://en.wikipedia.org/wiki/Universally_unique_identifier).
    * `level`: User level. See [Policy](../policy.md) for its usage.
    * `alterId`: Number of alternative IDs. Same as in Outbound.
    * `email`: Email address to identify users.
* `detour`: Optional feature to suggest client to take a detour.
  * `to`: The tag of an inbound proxy. See [Overview](../protocols.md). If configured, VMess will suggest its client to use the detour for further connections.
* `default`: Optional default client configuration. Usually used in detour proxy.
  * `level`: User level.
  * `alterId`: Number of alternative IDs. Default value 64.
* `disableInsecureEncryption`: Forbids client for using insecure encryption methods. When set to true, connections will be terminated immediately if the following encryption is used. Default value `false`.
  * `none`
  * `aes-128-cfb`

## Tips

* Always use encryption method `"auto"` to stay secure and compatible.
* VMess depends on system time. Please ensure that your system time is in sync with UTC time. Timezone doesn't matter.
  * One may install `ntp` service on Linux to automatically adjust system time.
* You may choose the value of `alterId` at your interest. For daily usage, a value less than `100` is usually enough.
