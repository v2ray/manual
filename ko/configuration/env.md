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

**Deprecated. Use bufferSize in Policy.**

For each connection, when there is a difference in speed between inbound and outbound traffic, V2Ray will cache some data for larger throughput. This setting controls the size of the cache. The larger the cache, the better the performance.

## V2Ray 자산의 위치 {#asset}

* 이름 : `v2ray.location.asset` 또는 `V2RAY_LOCATION_ASSET`
* 기본값 : v2ray가있는 디렉토리와 동일합니다.

This variable specifies a directory where geoip.dat and geosite.dat files are.

## V2Ray 구성의 위치 {#config}

* 이름 : `v2ray.location.config` 또는 `V2RAY_LOCATION_CONFIG`
* 기본값 : v2ray가있는 디렉토리와 동일합니다.

This variable specifies a directory where config.json is.

## 분산 형 읽기 {#scatter-io}

* 이름 : `v2ray.buf.readv` 또는 `V2RAY_BUF_READV`
* 기본값 : `자동`

V2Ray 3.37 uses Scatter/Gather IO. This feature will use less memory when connection speed is over 100 MByte/s. Possible values are: `auto`, `enable` and `disable`.

* `활성화`: 분산 읽기 활성화.
* `해제`: 분산 읽기를 비활성화합니다.
* `자동`: CPU가 x86, AMD64 또는 s390x 일 때 Windows, MacOS, Linux에서만 활성화됩니다.

When connection speed is less than 100 MByte/s, no matter whether this is enabled or not, there is no obvious difference in terms of memory usage.