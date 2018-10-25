# VMess Protocol

VMess is an encrypted communication protocol which is original invented by Project V.

## Version

Current version: v1

## Dependencies

### Underlying Protocol

VMess is based on TCP, all data are transmitted over TCP.

### User ID

ID is equivalent to [UUID](https://en.wikipedia.org/wiki/Universally_unique_identifier), which is a 16-byte long random number. Its effect is a token.
An ID, such as de305d54-75b4-431b-adb2-eb6b9e546014, is almost completely generated randomly. It can be generated from any generator. For example, [UUID Generator](https://www.uuidgenerator.net/).

User ID can be defined in [Config file](../../en/configuration/overview.md).

### Functions

* MD5: [MD5 Function](https://en.wikipedia.org/wiki/MD5)
  * Input parameter: an arbitrary length byte array.
  * Output: 16-byte long array.
* HMAC: [HMAC Function](https://en.wikipedia.org/wiki/Hash-based_message_authentication_code)
  * Input parameters：
    * H: Hash function.
    * K: Secret key，an arbitrary length byte array.
    * M: Messages，an arbitrary length byte array.
* Shake: [SHA3-Shake128 Function](https://en.wikipedia.org/wiki/SHA-3)
  * Input parameter: an arbitrary length string.
  * Output: an arbitrary length string.


## The Process of Communication

VMess is a stateless protocol that transfers data directly between the client and the server without handshaking. Each transmission has no effect on the transmission of other datas before and after.

Each time when a VMess client initiated a request, server will determine whether it's from a legal client. If the verification is passed, the request is forwarded. After that, the response obtained is sent back to the client.

Vmess is using an asymmetric format, which means the request from the client and the response from the server is in a different format.

## The Request from the Client

| 16 Bytes | X Bytes | Other Parts |
|---------|----------|--------|
| Authentication Credential | Command | Data |


### Authentication Credential

Authentication credential is a 16-byte long Hash value. It can be generated using the following information:

* H = MD5
* K = User ID (16 Bytes)
* M = UTC Time, accurate to seconds. The value is a random value of 30 seconds before or after the current time.
* Hash = HMAC(H,K,M)

### Command

The command is encrypted using AES-128-CFB.

* Key: MD5(User ID + []byte('c48619fe-8f02-49e0-b9e9-edf763e17e21'))
* IV: MD5(X + X + X + X), X = []byte(The time when authentication credential is generated) (8 Bytes, Big Endian)

| 1 Byte | 16 Bytes   | 16 Bytes | 1 Byte | 1 Byte | 4 Bits | 4 Bits | 1 Byte | 1 Byte | 2 Bytes | 1 Byte | N Byte | P Byte | 4 Bytes |
|---------|----------|---------|--------|--------|--------|--------|--------|--------|--------|--------|
| Version | Encryption IV | Encryption Key | Response Auth V | Options | Margin P | Encrypt Method | Reserved | Command | Port | Address Type | Address | Random Value | Checksum F |

Details about Options: (While something = 1, means it is enabled)

| 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
| X | X | X | X | X | M | R | S |

Among those things:

* Version: Always 1.
* Data Encryption IV: Random Value
* Data Encryption Key: Random Value.
* Response Auth V: Random Value.
* Options:
  * S (0x01): Standard Data Stream (Recommend to enable)
  * R (0x02): Client expect to reuse the connection (Deprecated after V2Ray 2.23+)
    * It is valid only when S is enabled.
  * M (0x04): Enable metadata obfuscation.
    * It is valid only when S is enabled.
    * While it is enabled, both client and server need to separately start up two Shake instances. They are: RequestMask = Shake(IV of request datas), ResponseMask = Shake(IV of Response datas).
  * X: Reserved.
* Margin P: Add a random P-byte value before the checksum.
* Encrypt Method: Specify the encryption method of the data part, the following value can be chosen:
  * 0x00: AES-128-CFB;
  * 0x01: None;
  * 0x02: AES-128-GCM;
  * 0x03: ChaCha20-Poly1305;
* Command:
  * 0x01: TCP Data;
  * 0x02: UDP Data;
* Port: Integer port number in Big Endian
* Address Type:
  * 0x01: IPv4;
  * 0x02: Domain name;
  * 0x03: IPv6;
* Address:
  * While T = 0x01, A is a 4-byte long IPv4 address;
  * While T = 0x02, A is ```1 Byte(L) + L-byte long domain name;
  * While T = 0x03, A is a 16-byte long IPv6 address;
