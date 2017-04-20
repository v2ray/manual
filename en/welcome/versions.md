# Version History

![English](../resources/english.svg) [![Chinese](../resources/chinese.svg)](https://www.v2ray.com/chapter_00/01_versions.html)

## 2017.04.21 v2.24

* Stablize Mux.
* Improves memory effeciency.

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

* Fix compatiblity with Alpine Linux.

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
