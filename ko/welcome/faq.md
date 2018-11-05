---
refcn: chapter_00/faq
refen: welcome/faq
---
# 자주 묻는 질문 (FAQ)

## V2Ray 사용

### V2Ray를 업그레이드하는 방법

* 최신 패키지 다운로드 또는
* 설치 스크립트 다시 실행 (Linux 전용)

### V2Ray 충돌

* Linux를 systemd와 함께 사용하는 경우 명령 `journalctl -u v2ray`사용하여 패닉 로그를 볼 수 있습니다.
* 일반적으로 명령 `v2ray -config =<config-file> -test` 를 실행하여 오류 정보를 볼 수 있습니다.

## V2Ray 오류

### 양말 : 알 수없는 양말 버전 : 67

가능한 원인들

* V2Ray에서 인바운드 양말을 사용하고 있지만 브라우저가 HTTP 프록시를 사용하도록 구성되어 있습니다.

해결책

* V2Ray에 HTTP 인바운드를 추가 한 다음이 프록시를 사용하도록 브라우저 프록시 설정을 업데이트하십시오.

## 이 프로젝트의 라이센스

프로젝트 V는 다음 라이센스를 사용합니다.

### V2 레이

소스 코드와 공식 릴리스는 다음 저장소의 소스 코드와 릴리스를 포함하여 MIT 라이센스에 따라 라이센스가 부여됩니다.

* [v2ray / v2ray-core](https://www.github.com/v2ray/v2ray-core/)
* [v2ray / ext](https://www.github.com/v2ray/ext)

### V2Ray.Com

공식 웹 사이트, [v2ray.com](https://www.v2ray.com/)은 [Creative Commons Attribution 4.0 International License](https://creativecommons.org/licenses/by/4.0/)의거하여 사용이 허가되었습니다.

* 모든 보이는 텍스트와 그림을 웹 사이트에 포함시킵니다.
* <a href="https://www.v2ray.com/resources/v2ray_1024.png" target="_blank">Project V 로고 포함</a>.
* 웹 사이트 생성에 사용되는 모든 소스 코드 (예 : [v2ray / manual](https://www.github.com/v2ray/manual)합니다.

### 스크린 샷 및 기타 파일 {#screenshots}

아래에 나열된 모든 제 3 자 파일은 작성자의 것입니다. 파일을 만든 사람은 파일을 소유합니다.

* Project V의 모든 스크린 샷 포함
* Project V를 실행하는 데 사용되는 모든 구성 파일을 포함합니다.
* 런타임 중에 Project V에서 생성 된 모든 로그를 포함합니다.

### 기타 콘텐츠 {#other}

위에 언급되지 않은 모든 컨텐츠는 케이스별로 라이센스가 부여됩니다.