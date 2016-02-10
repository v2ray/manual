# About V2Ray

V2Ray is an open source project built upon Golang. It runs on multiple operating systems.
V2Ray is a platform that supports multiple network proxies. With V2Ray's help, it is easy to convert messages in one proxy to another.

V2Ray has its own VMess protocol which can be used for obfuscating messages, and ensure the messages between two V2Ray nodes are not recognizable.

## Features
### Multi-User
VMess protocol supports multi-user authentication on one port. It is not necessary to open multiple ports for multiple users.

### Dynamic Port Allocation
Once configured properly, V2Ray client and server may change ports for communcation on a regular basis. This is helpful to avoid QoS in some ISPs.

### Flexible Configuration
With different configuration, V2Ray can behave like a client or a server with just one binary. 

### Internal Routing
V2Ray has an internal router. User can set the routing target by IPs or domains. Compared with browser's PAC settings, V2Ray's router is more efficient in a way.

## Supported OSes
* Windows Vista and later (x86 / amd64);
* Mac OS X 10.7 and later (amd64);
* Linux 2.6.23 and later (x86 / amd64 / arm / arm64);
  * Including but not limited to Debian 7 / 8, Ubuntu 12.04 / 14.04 and later, CentOS 6 / 7, Arch Linux;
