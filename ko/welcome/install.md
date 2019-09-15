---
refcn: chapter_00/install
refen: welcome/install
---

# 다운로드 & 설치

## 플랫폼 {#platform}

V2Ray는 다음 플랫폼에서 사용할 수 있습니다.

* Windows 7 이상 (x86 / amd64)
* Mac OS X 10.10 요세미티 이상 (amd64)
* Linux 2.6.23 이상 (x86 / amd64 / arm / arm64 / mips64 / mips) 
  * 데비안 7 / 8, 우분투 12.04 / 14.04 이상, CentOS 6 / 7, 아치 리눅스
* FreeBSD (x86 / amd64)
* OpenBSD (x86 / amd64)
* 잠자리 BSD (amd64)

## 다운로드 {#download}

사전 제작 된 패키지는 다음에서 찾을 수 있습니다.

1. Github 출시 : [github.com/v2ray/v2ray-core](https://github.com/v2ray/v2ray-core/releases)
2. Redistribution: [github.com/v2ray/dist](https://github.com/v2ray/dist)
3. 자작 : [github.com/v2ray/homebrew-v2ray](https://github.com/v2ray/homebrew-v2ray)
4. 아치 리눅스 : [패키지 / 커뮤니티 / x86_64 / v2ray /](https://www.archlinux.org/packages/community/x86_64/v2ray/)
5. 스냅 크래프트 : [snapcraft.io/v2ray-core](https://snapcraft.io/v2ray-core)

모든 패키지는 ZIP 형식입니다. 해당 패키지를 다운로드하여 시스템에 압축을 풉니 다.

## 확인 {#verify}

패키지를 검증하는 2 가지 방법이 있습니다.

1. 각각 `.ZIP` 파일은 대응 갖는 `.dgst` SHA 다이제스트위한 파일.
2. 실행 파일 (v2ray / v2ray.exe)에 대한 GPG 서명 파일은 동일한 패키지의 v2ray.sig (또는 v2ray.exe.sig)에서 찾을 수 있습니다. 공개 키는 저장소</a>에서 입니다.</li> </ol> 
  
  ## Windows 또는 Mac OS에 설치 {#install-windows}
  
  패키지 압축을 푼 후 v2ray / v2ray.exe를 실행하십시오.
  
  ## Linux에 설치 {#install-linux}
  
  우리는 리눅스에 설치하기위한 스크립트를 제공합니다. 이 스크립트는 이전에 설치된 v2ray를 감지하고 그에 따라 새 버전을 업그레이드 또는 설치합니다. 이전 버전이있는 경우 업그레이드 중에 / etc / v2ray에있는 구성 파일을 덮어 쓰지 않습니다.
  
  다음 명령은 루트 권한을 가정합니다.
  
  다음 명령을 실행하여 V2Ray를 설치하십시오. yum 또는 apt를 사용할 수 있으면 스크립트는 unzip 및 daemon / systemd를 설치합니다. V2Ray를 서비스로 실행해야합니다. Linux 시스템이 yum이나 apt를 지원하지 않으면 수동으로 설치해야합니다.
  
  ```bash
  curl -Ls https://install.direct/go.sh | sudo bash
  ```
  
  스크립트는 다음 파일을 설치합니다.
  
  * `/ usr / bin / v2ray / v2ray`: V2Ray 실행 파일
  * `/ usr / bin / v2ray / v2ctl`: 유틸리티
  * `/etc/v2ray/config.json`: 설정 파일
  * `/usr/bin/v2ray/geoip.dat`: IP 데이터 파일
  * `/usr/bin/v2ray/geosite.dat`: 도메인 데이터 파일
  
  이 스크립트는 systemd를 사용할 수있는 경우 V2Ray가 서비스로 실행되도록 구성합니다.
  
  구성은 다음 위치에 있습니다.
  
  * `/etc/systemd/system/v2ray.service`: Systemd
  * `/etc/init.d/v2ray`: SysV
  
  설치 후 다음 작업을 수행해야합니다.
  
  1. 자신 만의 시나리오를 위해 `/etc/v2ray/config.json` 파일을 업데이트하십시오.
  2. `service v2ray start` 명령을 실행하여 V2Ray를 시작합니다.
  3. V2Ray 서비스를 제어하려면 선택적으로 `서비스 v2ray start | stop | status | reload | restart | force-reload` 을 실행하십시오.
  
  ### go.sh {#gosh}
  
  go.sh는 다음 매개 변수를 지원합니다.
  
  * `-p` 또는 `--proxy`: 프록시를 사용하여 V2Ray 패키지를 다운로드하십시오. 컬 포맷과 동일 같은 `"SOCKS5 : //127.0.0.1 1080"` 또는 `"http://127.0.0.1:3128"`.
  * `-f` 또는 `- 강제`: 강제 설치. 스크립트는 V2Ray가 전혀 설치되지 않았다고 가정합니다.
  * `- 버전`: `"v1.13"과 같이 설치할 버전`. 기본값은 최신 안정 릴리스입니다.
  * `로컬`: 설치에 로컬 패키지를 사용하십시오.
  
  예 :
  
  * SOCKS 프록시 127.0.0.1:1080을 사용하여 최신 패키지를 설치하십시오. ```./go.sh -p socks5://127.0.0.1:1080```
  * 로컬 파일에서 v1.13 설치 :```./go.sh --version v1.13 --local /path/to/v2ray.zip```
  
  ## 도커 {#docker}
  
  V2Ray는 2 개의 도커 이미지를 제공합니다.
  
  * [v2ray / official](https://hub.docker.com/r/v2ray/official/): 공식 릴리스가 포함되어 있습니다.
  * [v2ray / dev](https://hub.docker.com/r/v2ray/dev/): 최신 코드가 들어 있습니다.
  
  2 개의 이미지는 Linux 설치와 동일한 구조를가집니다.