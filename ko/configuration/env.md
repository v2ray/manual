---
refcn: chapter_02/env
refen: configuration/env
---
# 환경 변수

V2Ray는 다음 환경 변수를 읽습니다.

## 연결 당 캐시 크기 {#buffer-size}

* 이름 : `v2ray.ray.buffer.size` 또는 `V2RAY_RAY_BUFFER_SIZE`
* 단위 : MB
* 기본값 : x86, amd64, arm64 및 s390x에서는 2입니다. 다른 플랫폼에서는이 캐시를 사용할 수 없습니다.
* 특별 값 : 무제한 캐시 크기의 경우 0

각 연결에 대해 인바운드 및 아웃 바운드 트래픽간에 속도 차이가있을 때 V2Ray는 더 많은 처리량을 위해 일부 데이터를 캐시합니다. 이 설정은 캐시의 크기를 제어합니다. 캐시가 클수록 성능이 향상됩니다.

## V2Ray 자산의 위치 {#asset}

* 이름 : `v2ray.location.asset` 또는 `V2RAY_LOCATION_ASSET`
* 기본값 : v2ray가있는 디렉토리와 동일합니다.

이 변수는 geoip.dat 및 geosite.dat 파일이있는 디렉토리를 지정합니다.

## V2Ray 구성의 위치 {#config}

* 이름 : `v2ray.location.config` 또는 `V2RAY_LOCATION_CONFIG`
* 기본값 : v2ray가있는 디렉토리와 동일합니다.

이 변수는 config.json이있는 디렉토리를 지정합니다.

## 분산 형 읽기 {#scatter-io}

* 이름 : `v2ray.buf.readv` 또는 `V2RAY_BUF_READV`
* 기본값 : `자동`

V2Ray 3.37은 Scatter / Gather IO를 사용합니다. 이 기능은 연결 속도가 100MByte / s 이상이면 메모리를 적게 사용합니다. 가능한 값은 다음과 같습니다. `자동`, `사용 가능` 및 `사용 안함`.

* `활성화`: 분산 읽기 활성화.
* `해제`: 분산 읽기를 비활성화합니다.
* `자동`: CPU가 x86, AMD64 또는 s390x 일 때 Windows, MacOS, Linux에서만 활성화됩니다.

연결 속도가 100 MByte / s보다 낮 으면이 기능의 사용 가능 여부와 관계없이 메모리 사용량 측면에서 분명한 차이가 없습니다.