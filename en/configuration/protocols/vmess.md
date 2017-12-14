# VMess

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
    * `alterId`: Number of alternative IDs. The alternative IDs will be generated in a deterministic way. Default to 0. Maximum 65535. Recommend 32.
    * `level`: User level. See [Policy](../Policy.md) for more detail.
    * `security`: Encryption method. Options are:
      * `"aes-128-cfb"`
      * `"aes-128-gcm"`: Recommended for PC.
      * `"chacha20-poly1305"`: Recommended for mobile.
      * `"auto"`: Default value. Use `aes-128-gcm` on AMD64 and S390x, or `chacha20-poly1305` otherwise.
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
  }
}
```

其中：

* `clients`: An array for valid user accounts. May be empty when used for dynamic port feature.
  * Each client contains:
    * `id`: User ID, in the form of [UUID](https://en.wikipedia.org/wiki/Universally_unique_identifier).
    * `level`：User level. See [Policy](../policy.md)
    * `alterId`: Number of alternative IDs. Same as in Inbound. Value must be the same as connecting clients.
    * `email`: Email address to identify users.
* `detour`: Optional feature to suggest client to take a detour.
  * `to`: The tag of an outbound proxy. See [Overview](../02_protocols.md). If configured, VMess will suggest its client to use the detour for further connections.
* `default`: Optional default client configuration. Usually used in detour proxy.
  * `level`: User level.
  * `alterId`: Number of alternative IDs. Default value 64.
