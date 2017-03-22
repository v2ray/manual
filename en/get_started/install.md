# Installation

The core of V2Ray is a command-line program, it can work in different platforms using the same configuration file. Pre-compiled core program can be found in [Release](https://github.com/v2ray/v2ray-core/releases).

If you need a GUI, please use [third-party clients](3rd_party.md).

**In order to make V2Ray work, please make sure the UTC time offset between the clients and the server is in 2 minutes.**

## Verify

V2Ray provides 2 ways of verfication.
1. There is a metadata.txt file which provides the ZIP file's SHA1 hash, it can be found in the download page.
2. Verify the PGP signature of v2ray.exe, the signature file(v2ray.exe.sig) can be found in the ZIP file which contains V2Ray core. Public key can be found in [the repo](https://raw.githubusercontent.com/v2ray/v2ray-core/master/tools/release/verify/official_release.asc).
## Command-line parameters

List of parameters that in V2Ray core.

```shell
v2ray [-version] [-test] [-config=config.json] [-format=json]
```

* `-version`: Output the current V2Ray version that you are running, then exit.
* `-test`: check whether your config file is valid then exit. Debug messages will be outputted if errors found.
* `-config`:
  * The config file's path, default value is config.json;
  * If the value is `stdin:`, config will be read from standard input, you must close the standard input stream after done with input.
* `-format`: Format of the config file:
  * `json`: JSON format
  * `pb` or `protobuf`: Protobuf format;

## Install script for Linux

V2Ray provides a script that can install or update V2Ray. If V2Ray is installed, then the script will update V2Ray to the lastest version, otherwise it will perform a install.

The commands below need to be executed under root user.

Notice: If yum or apt-get is available, the script will install unzip and daemon, these components are necessary for V2Ray. If your system does not support yum or apt-get, please install unzip and daemon manually first.

```shell
bash <(curl -L -s https://install.direct/go.sh)
```

The files below will be created by the install script：

* `/usr/bin/v2ray/v2ray`：V2Ray Core Program；
* `/etc/v2ray/config.json`：Config file；

This script will create a daemon which can run V2Ray automatically after system rebooted. For now, the daemon script only supports systems that have Systemd or debian derivatives (Such as Ubuntu).

Daemon scripts' path below:

* `/lib/systemd/system/v2ray.service`: Systemd
* `/etc/init.d/v2ray`: SysV

After finished install, you need to:

1. Edit /etc/v2ray/config.json to config your proxy method;
2. Run service v2ray start to start V2Ray process;
3. Then you can use service v2ray start|stop|status|reload|restart|force-reload to control the running status of V2Ray.

### go.sh parameters

go.sh supports parameters below, you can adjust the parameter when necessary:

* `-p` or `--proxy`: Use a proxy server to download V2Ray core, format is same as curl's parameter, such as `"socks5://127.0.0.1:1080"` or  `"http://127.0.0.1:3128"`。
* `-f` or `--force`: force install. In default stituation, go.sh will exit if there is lastest V2Ray installed on the system. Use this parameter iff you want to force reinstall(will override your current config.json file).
* `--version`: Specify the version that you want to install, such as `"v1.13"`. Default is to install the lastest version.
* `--local`: Use a local file to install. If you already downloaded a version of V2Ray, then you can use this parameter to specifylly install from a file.

**Examples**

* Use 127.0.0.1:1080 as a SOCKS proxy to download and install lastest version：```./go.sh -p socks5://127.0.0.1:1080```
* Install v1.13 version from local：```./go.sh --version v1.13 --local /path/to/v2ray.zip```

## Docker

V2Ray provides 2 pre-compiled Docker image:

* [v2ray/official](https://hub.docker.com/r/v2ray/official/) [![](https://images.microbadger.com/badges/image/v2ray/official.svg)](https://microbadger.com/images/v2ray/official): The Lastest version which updates weekly;
* [v2ray/dev](https://hub.docker.com/r/v2ray/dev/) [![](https://images.microbadger.com/badges/image/v2ray/dev.svg)](https://microbadger.com/images/v2ray/dev): Dev version which compiles from the lastest update of repo;

The structures of the 2 images are same.

* /etc/v2ray/config.json: Config file
* /usr/bin/v2ray/v2ray: V2Ray Core
