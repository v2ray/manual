---
refcn: chapter_00/01_versions
refen: welcome/versions
---

# Lịch sử phiên bản

This page lists regular releases with feature updates. If a Github release doesn't appear here, it usually only contains bug fixes.

## 2019.03.01 v4.18

* Port list in routing rules now supports mixed format.
* Updated `geosite` information in routing, and description for static hosts in DNS.
* Option to not use system root CAs for TLS handshake.
* New routing rule for traffic attributes.

## 2019.02.22 v4.17

* New sub-command `tlsping` in V2Ctl.

## 2019.02.15 v4.16

For end users:

* DNS outbound proxy now supports to modify DNS server info.

For developers:

* 'ext' repository is now deprecated. [#1541](https://github.com/v2ray/v2ray-core/issues/1541)

## 2019.02.08 v4.15

* DNS outbound proxy.

## 2019.02.01 v4.14

* Static DNS mapping now supports domain to domain mapping.

## 2019.01.18 v4.13

* Quic lib updated. It is not compatible with previous versions.
* DNS now have `tag` settings.

## 2019.01.11 v4.11

For developers:

* New method: [core.DialUDP](https://github.com/v2ray/v2ray-core/blob/b52725cf659e0f7a38fed2eb36a5a792843bd54f/functions.go#L65)
* [internet.DialSystem](https://github.com/v2ray/v2ray-core/blob/a1b552f9487d2687228dd1d89003087331f62eab/transport/internet/dialer.go#L66) now uses [internet.ListenSystemPacket](https://github.com/v2ray/v2ray-core/blob/a1b552f9487d2687228dd1d89003087331f62eab/transport/internet/tcp_hub.go#L65) to establish UDP connections.

## 2018.12.07 v4.8

For end users:

* Bug fixes

For developers:

* New [API doc](https://github.com/v2ray/v2ray-core/blob/master/annotations.go#L13)
* New method: [internet.RegisterListenerController](https://github.com/v2ray/v2ray-core/blob/v4.8.0/transport/internet/system_listener.go#L63)
* New method: [internet.RegisterDialerController](https://github.com/v2ray/v2ray-core/blob/v4.8.0/transport/internet/system_dialer.go#L105)

## 2018.11.30 v4.7

* Freedom now supports for dialing IPv4 or IPv6 address only.
* New QUIC transport.

## 2018.11.23 v4.6

* Freedom now can automatically choose between IPv4 and IPv6 destination address, based on `SendThrough` settings.

## 2018.11.16 v4.4

* Load balancer rules in routing.
* Memory usage gets optimized.

## 2018.11.05 v4.1

* JSON configuration format changes. Old format is still suported.
* Performance on GeoIP matching is improved.

## 2018.11.02 v4.0

* Reverse proxy.
* Release packages for ppc64 and ppc64le.

## 2018.10.12 v3.47

* Migrate to a new continuous delivery pipeline

## 2018.09.28 v3.44

* Dokodemo-door now supports TProxy in Linux.

## 2018.09.21 v3.43

* DNS now supports on-demand queries by domain.

## 2018.09.14 v3.40

* New socket options in transport configuration. It can be used to setup VPNs.
* New TCP Fast Open option in transport configuration.

## 2018.09.03 v3.38

* mKCP has a new WireGuard header.
* Fix softfloat binaries in mips/mips64.

## 2018.08.31 v3.37

* Performance of reading network connection in optilized. See [Environment Variables](../configuration/env.md)。
* VMess uses AES-128-GCM by default on ARM64.
* Built by Go 1.11.

## 2018.08.24 v3.36

* Great performance improvement on subdomain matching (`domain:`) in routing.
* Full domain matching is now supported in routing.

## 2018.08.07 v3.34

* Better memory management on most devices.

## 2018.07.27 v3.32

* BitTorrent traffic can now be sniff'ed.
* New `protocol` option in routing rules for protocol-based routing.
* New `geosite:speedtest` option in routing rules to match all public servers of speedtest.net.

## 2018.07.20 v3.31

* New [Domain Socket transport](../configuration/transport/domainsocket.md) (Thanks to @xiaokangwang).

## 2018.07.13 v3.30

* Fix an issue that may cause broken connections in mKCP.
* Thanks to [our friends](https://crowdin.com/project/v2ray) who speak Russian. Now our documents are in [Russian](https://www.v2ray.com/ru/).

## 2018.07.06 v3.29

* New inbound and outbound for MTProto proxy.

## 2018.06.29 v3.27

* DNS now supports EDNS client subnet.
* DNS static host now supports sub-domain matching.

## 2018.06.15 v3.26

* Add Dragonfly BSD release.

## 2018.06.01 v3.24

* Internal buffer size (per connection) can now be configured in JSON configuration.
* mKCP now supports DTLS 1.2 header.
* TLS transport now only support cipher suites in TLS 1.3 spec.

## 2018.05.25 v3.23

* In JSON configuration, port can now be specified from env variables.
* JSON config now supports to load domains and IPs from specified files.

## 2018.04.20 v3.19

* Traffic stats for inbound proxies.

## 2018.04.13 v3.17

* V2Ray can load config file from HTTP(s).
* TLS in V2Ray can issue new certificates by provided CA certificates for domains in incoming requests.
* [HTTP/2](../configuration/transport/h2.md) transport.

## 2018.04.06 v3.16

* [Statistics](../configuration/stats.md).
* Shadowsocks inbound now can be configured to only listen on UDP. Strongly recommend to not listen on both TCP and UDP on the same port.

## 2018.03.02 v3.11

* A new settings is introduced in VMess inbound, to forbid client using insecure encryption methods.
* Offers ARMv7 release.
* Offers MIPS release that doesn't require FPU.

## 2018.02.23 v3.10

* Log entries now contain session ID to distinguish proxy sessions.
* Bug fixes.

## 2018.02.15 v3.9

* Happy New Year!
* Bug fixes.

## 2018.02.09 v3.7

* Developer preview: [Remote API](../configuration/api.md)。
* Bug fixes.

## 2017.12.29 v3.5

* Geoip now supports private network address under name "private".

## 2017.12.22 v3.4

* Websocket nows uses value of X-Forwarded-For header as source address.
* Support s390x CPU architecture.

## 2017.12.08 v3.1

* Support policy.
* Config file location can be specified via environment variable.

## 2017.12.01 v3.0

* Support Shadowsocks AEAD

## 2017.11.18 v2.50

* `v2ray` now tried to use `v2ctl` for configuration parsing. Please make sure these 2 files are in the same directory.
* New `IPOnDemand` strategy in routing.

## 2017.11.10 v2.47

* `geosite` data is now in `geosite.dat` file.
* Bug fixes.

## 2017.11.03 v2.46

* Router now supports `geosite:cn`, equivalent to existing `chinasites`, but more flexible.
* Router now supports `geoip`. 
  * File `geoip.dat` is added to release packages. This file contains all `geoip` information and has to stay in the same directory of `v2ray` program. Due to delayed update of installation script, you may have to copy the file manually.
* Program `v2ctl` is added to release packages. You may run `v2ctl verify /path/to/v2ray` to verify the signature of `v2ray` program.

## 2017.10.27 v2.44

* HTTP now supports Basic Authentication.
* Some bugs are fixed.

## 2017.10.06 v2.40

* Fix an issue that causes memory leak.

## 2017.09.29 v2.39

* Inbound proxies now close connections more quickly when remote server closes them.
* Default connection timeout changes to 5 minutes.

## 2017.05.12 v2.27

* New domain mode in router.

## 2017.05.05 v2.26

* Stability fixes.

## 2017.04.28 v2.25

* Simple sniffing on HTTP and TLS traffic for the actual domain on request.

## 2017.04.21 v2.24

* Stabilize Mux.
* Improves memory efficiency.

## 2017.04.15 v2.23

* Performance improvement in Mux.
* Max number of connections can be configured in Mux now.
* Performance improvement in HTTP inbound.
* connectionReuse setting is removed in favor of Mux.

## 2017.04.08 v2.22

* Mux.Cool protocol.

## 2017.02.25 v2.20

* GPG signature is added to download package.
* New binary wv2ray.exe is added to Windows package, which runs as a background application.

## 2017.02.18 v2.19

* A new mechanism for anti reply attack is now enforced on server side. 
  * No impact to existing clients.
* Upgrade of VMess AES-128-GCM / Chacha20-Poly1305 / None encryption methods. 
  * Please upgrade client and server at once.
  * AES-128-CFB is not affected.
* Built with Golang 1.8. Add 32-bit MIPS support.

## 2017.02.11 v2.18

* Cleanup WebSocket code.
* Remove allowPassive option. Now passive connections are always allowed.
* Bug fixes

## 2017.02.04 v2.17

* Bug fixes.

## 2017.01.28 v2.16

* New 'redirect' option in freedom. It can be used to adapt tools like Shadowsocks Obfs.
* Performance improvement in VMess non-encryption mode. Not compatible with previous versions.
* Happy New Year!

## 2017.01.16 v2.15

* All proxies can use mKCP and WebSocket now.

## 2017.01.09 v2.14

* Socks 5 outbound.
* Bug fixes.

## 2017.01.02 v2.13

* Bug fixes.

## 2016.12.26 v2.12

* Bug fixes.

## 2016.12.19 v2.11

* JSON config file now supports comment.

## 2016.12.12 v2.10

* VMess now supports AES-GCM and ChaCha20-Poly1305 encryption methods.

## 2016.12.05 v2.9

* Fix compatibility with Alpine Linux.

## 2016.11.28 v2.8

* Shadowsocks server now accepts OTA settings.
* Bug fixes.

## 2016.11.21 v2.7

* Main inbound and outbound connection handler can be tagged now.
* Bug fixes.

## 2016.11.14 v2.6

* Data sent by one outbound can be proxied to another outbound.
* Routing can be based on inbound tag.

## 2016.11.07 v2.5

* New Shadowsocks outbound;
* New TCP header: HTTP;

## 2016.10.24 v2.4

* TCP / mKCP / WebSocket can be configured per inbound / outbound;
* Routing can be done on source IP;

## 2016.10.17 v2.3

* Introduce new Protobuf-based configuration;
* OpenBSD binaries;
* Small fixes;

## 2016.09.19 v2.2

* New transport: WebSocket (Thanks to [@xiaokangwang](https://github.com/xiaokangwang));

## 2016.09.19 v2.1

* mKCP performance improvement;

## 2016.08.20 v2.0

* One year;

## 2016.08.15 v1.24

* New mKCP header: utp;
* New option in inbound connection config "allowPassive" to allow passive connection;

## 2016.08.08 v1.23

* Optimize mKCP packet format. This version of mKCP is NOT compatible with previous ones;
* mKCP can now be configured to disguise as video data.

## 2016.08.01 v1.22

* Fix a memory leak in mKCP;
* Add FreeBSD release;

## 2016.07.25 v1.21

* High performance Chacha20 (Thanks to aead@);
* Bug fixes;

## 2016.07.18 v1.20

* New KCP options: readBufferSize and writeBufferSize;
* Bug fixes;

## 2016.07.11 v1.19

* Enable TLS option for all proxies;
* Fix a performance issue in KCP;
* Fix an issue in KCP that could cause EOF response;

## 2016.07.04 v1.18

* Fix a "too many open files" issue in KCP;
* KCP now uses fewer CPU;
* Other bug fixes;

## 2016.06.19 v1.17

* KCP now is integrated into V2Ray. (Special thanks to [xiaokangwang](https://github.com/xiaokangwang), [xtaci](https://github.com/xtaci) and [skywind3000](https://github.com/skywind3000))
* Minor bug fixes

## 2016.06.12 v1.16

* TCP connection reuse is now enabled by default;
* Dokodemo-door is able to recognize TCP connection redirected by iptables;
* Blackhole is able to send back HTTP forbidden data;

## 2016.06.05 v1.15

* Optionally reuse TCP connection for better performance;
* Allow listening on a specific IP address;
* Allow sending data through a specific IP address;
* Fix an issue in HTTP proxy that may exhaust memory;

## 2016.05.29 v1.14

* Fix a panic issue in http proxy;
* More functionalies in install script;
* Static route in DNS;
* Official server address change;

## 2016.05.16 v1.13

* Internal DNS server, to provide better routing results combined with chinasites and chinaip;
* Fix an issue in UDP relay;

## 2016.05.01 v1.12.1

* Fix a bug in VMess.

## 2016.05.01 v1.12

* Second try to fix the memory usage issue;
* Improve Shadowsocks performance;
* New option "none" in loglevel;

## 2016.04.18 v1.11

* Try to fix the memory usage issue.

## 2016.03.07 v1.10

* Fix an performance issue when dynamic ports refreshes.

## 2016.02.29 v1.9.1

* Fix Shadowsocks one-time authentication (OTA) issue.

## 2016.02.29 v1.9

* Support for Shadowsocks ChaCha20 encryption;
* Add more direct connection sites to the default configuration file;
* Dynamic ports now automatically create an account.

## 2016.02.22 v1.8

* Update installation script install-release.sh (thanks, @netcookies): 
  * You can now automatically stop the V2Ray process and update automatically after the completion of V2Ray;
  * The install-release.sh accepts the --proxy argument and V2Ray specified proxy download;
* Use Go 1.6 compiler to improve the performance of AES encryption;
* Minor fixes;
* Update the official server IP (please re-download the installation package to get the latest configuration).

## 2016.02.08 v1.7

* UDP relay performance improved;
* Shadowsocks security improved;
* Minor fixes;
* Happy new year!