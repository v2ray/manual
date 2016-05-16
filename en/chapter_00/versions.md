# Version History

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
