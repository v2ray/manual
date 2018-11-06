---
refcn: chapter_00/command
refen: welcome/command
---
# 명령 행

## V2 레이

V2Ray에는 다음과 같은 명령 줄 매개 변수가 있습니다.

```shell
v2ray [-version] [-test] [-config=config.json] [-format=json]
```

어디에:

* `-version`: V2Ray 버전 만 인쇄 한 다음 종료하십시오.
* `테스트`: 구성을 테스트하고 오류를 출력 한 다음 종료하십시오.
* `-config`: 구성의 URI. Avilable 형식은 다음과 같습니다. 
  * 로컬 설정 파일의 경로. 상대 경로 또는 절대 경로 일 수 있습니다.
  * `"stdin :"`: 표준 입력에서 구성을 읽는 V2Ray를 나타냅니다. 발신자는 구성을 기록한 후에 표준 입력을 닫아야합니다.
  * 값은 `시작합니다. http : //` 또는 `https : //` (소문자) : V2Ray는 원격 주소에서 구성을로드하려고 시도합니다.
* `-체재`: 구성 형식. 선택 사항은 다음과 같습니다. 
  * `json`: JSON 형식입니다.
  * `pb` 또는 `protobuf`: protobuf 형식.

{% hint style='info' %}

When `-config` is not specified, V2Ray first tries to load configuration from `config.json` under working directory, then from the directory specified by [environment variable](../configuration/env.md) `v2ray.location.asset`.

{% endhint %}

## V2Ctl

V2Ctl has the following commandline parameters:

```shell
v2ctl <command> <options>
```

Available commands are listed below. Each command has its own options.

### 확인

`v2ctl verify [--sig=/path/to/sigfile] /file/to/verify`

To verify the signature of a V2Ray binary.

Options:

* `시그마`: 서명 파일의 경로. 기본값은 확인할 경로에 대한 ".sig"파일입니다.
* 첫 번째 인수 : 확인할 파일입니다.

### 구성

`v2ctl config`

No options. This command reads configuration in JSON format from stdin, and then write corresponding configuration in Protobuf format to stdout.

### UUID

`v2ctl uuid`

No options. This command prints a random UUID.