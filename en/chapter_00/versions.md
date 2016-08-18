# Version History

![English](../resources/english.svg) [![Chinese](../resources/chinese.svg)](https://www.v2ray.com/chapter_00/01_versions.html)

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
  * You can now automatically stop the V2Ray process and update automatically 
after the completion of V2Ray;
  * The install-release.sh accepts the --proxy argument and V2Ray specified proxy
download;
* Use Go 1.6 compiler to improve the performance of AES encryption;
* Minor fixes;
* Update the official server IP (please re-download the installation package to
get the latest configuration).

## 2016.02.08 v1.7
* UDP relay performance improved;
* Shadowsocks security improved;
* Minor fixes;
* Happy new year!
