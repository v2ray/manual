---
refcn: chapter_00/install
refen: welcome/install
---

# دانلود & نصب

## سکو {#platform}

V2Ray در سیستم عامل های زیر موجود است:

* ویندوز 7 و بعد (x86 / amd64)
* Mac OS X 10.10 Yosemite و بعد (amd64)
* لینوکس 2.6.23 و بعد (x86 / amd64 / arm / arm64 / mips64 / mips) 
  * شامل اما نه محدود به Debian 7/8، اوبونتو 12.04 / 14.04 و بعدا، CentOS 6/7، Arch Linux
* FreeBSD (x86 / amd64)
* OpenBSD (x86 / amd64)
* سنجاقک BSD (amd64)

## دانلود {#download}

بسته های پیش ساخته شده را می توان در اینجا پیدا کرد:

1. Github انتشار: [github.com/v2ray/v2ray-core](https://github.com/v2ray/v2ray-core/releases)
2. Redistribution: [github.com/v2ray/dist](https://github.com/v2ray/dist)
3. Homebrew: [github.com/v2ray/homebrew-v2ray](https://github.com/v2ray/homebrew-v2ray)
4. آرچ لینوکس: [بسته / جامعه / x86_64 / v2ray /](https://www.archlinux.org/packages/community/x86_64/v2ray/)
5. Snapcraft: [snapcraft.io/v2ray-core](https://snapcraft.io/v2ray-core)

همه بسته ها در قالب ZIP هستند. بسته های مربوطه را به سیستم خود دانلود و باز کنید.

## تأیید {#verify}

2 روش برای بررسی بسته ها وجود دارد.

1. هر فایل `.zip` فایل مربوطه `.dgst` برای هضم SHA دارد.
2. فایل امضای GPG برای اجرا (v2ray / v2ray.exe) را می توان در v2ray.sig (یا v2ray.exe.sig) در همان بسته پیدا کرد. کلید عمومی [در مخزن](https://raw.githubusercontent.com/v2ray/v2ray-core/master/release/verify/official_release.asc).

## نصب در ویندوز یا سیستم عامل مک {#install-windows}

پس از پاک کردن بسته ها، v2ray / v2ray.exe را اجرا کنید.

## لینوکس را نصب کنید {#install-linux}

ما یک اسکریپت برای نصب در لینوکس ارائه می دهیم. این اسکریپت v2ray نصب شده قبلی را تشخیص داده و سپس بروز رسانی یا نصب جدیدی را بر عهده دارد. اگر یک نسخه قبلی وجود دارد، فایل پیکربندی در / etc / v2ray در هنگام ارتقاء مجددا نویسی نخواهد شد.

دستور زیر اجازه دسترسی به ریشه را می دهد.

برای نصب V2Ray دستور زیر را اجرا کنید. اگر yum یا apt در دسترس باشد، اسکریپت unzip و daemon / systemd را نصب خواهد کرد. آنها نیاز به اجرای V2Ray به عنوان یک سرویس دارند. اگر سیستم لینوکس شما yum یا apt را پشتیبانی نمی کند، باید آنها را به صورت دستی نصب کنید.

```bash
curl -Ls https://install.direct/go.sh | sudo bash
```

اسکریپت فایل های زیر را نصب می کند.

* `/ usr / bin / v2ray / v2ray`: V2Ray executable
* `/ usr / bin / v2ray / v2ctl`: Utility
* `/etc/v2ray/config.json`: فایل پیکربندی
* `/usr/bin/v2ray/geoip.dat`: فایل داده های IP
* `/usr/bin/v2ray/geosite.dat`: فایل داده دامنه

این اسکریپت همچنین V2Ray را به عنوان سرویس اجرا می کند، اگر systemd در دسترس باشد.

تنظیمات در مکان های زیر قرار دارند.

* `/etc/systemd/system/v2ray.service`: Systemd
* `/etc/init.d/v2ray`: SysV

پس از نصب، ما باید:

1. به روز رسانی `/etc/v2ray/config.json` فایل برای سناریوی خودتان.
2. اجرا `سرویس v2ray شروع` دستور برای شروع V2Ray.
3. اختیاری `سرویس v2ray start | stop | status | reload | restart | force-reload` برای کنترل سرویس V2Ray.

### برو {#gosh}

go.sh از پارامترهای زیر پشتیبانی می کند.

* `-p` یا `پروکسی`: از پروکسی برای دانلود بسته های V2Ray استفاده کنید. همان فرمت Curl مانند `"socks5: //127.0.0.1: 1080"` یا `"http://127.0.0.1:3128"`.
* `-f` یا `--force`: نیروی نصب. اسکریپت فرض می کند V2Ray در همه نصب نشده است.
* `- نسخه`: نسخه نصب شده، مانند `"v1.13"`. مقدار پیش فرض آخرین نسخه پایدار است.
* `محلی`: از یک بسته محلی برای نصب استفاده کنید.

مثال ها:

* برای نصب آخرین بسته از SOCKS proxy 127.0.0.1:1080 استفاده کنید: ```./go.sh -p socks5://127.0.0.1:1080```
* نصب فایل v1.13 از فایل محلی:```./go.sh --version v1.13 --local /path/to/v2ray.zip```

## داكر {#docker}

V2Ray تصاویر 2 بارانداز را فراهم می کند:

* [v2ray / official](https://hub.docker.com/r/v2ray/official/): شامل نسخه های رسمی است.
* [v2ray / dev](https://hub.docker.com/r/v2ray/dev/): دارای آخرین کد است.

2 تصویر دارای ساختار مشابهی با نصب لینوکس است.