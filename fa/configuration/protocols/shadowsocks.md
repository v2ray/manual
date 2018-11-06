---
refcn: chapter_02/protocols/shadowsocks
refen: configuration/protocols/shadowsocks
---
# Shadowsocks

* نام: `shadowsocks`
* نوع: ورودی / خروجی

[Shadowsocks](https://www.shadowsocks.org/) پروتکل، برای هر دو اتصالات ورودی و خروجی.

سازگاری با نسخه رسمی:

* پشتیبانی از هر دو اتصال TCP و UDP، جایی که UDP می تواند اختیاری خاموش شود.
* پشتیبانی می کند [OTA](https://web.archive.org/web/20161221022225/https://shadowsocks.org/en/spec/one-time-auth.html)؛ 
  * مشتری ممکن است انتخاب کند که روشن یا خاموش شود.
  * سرور ممکن است فعال، غیرفعال یا خودکار را انتخاب کند.
* روش های رمزنگاری ([AEAD](https://shadowsocks.org/en/spec/AEAD-Ciphers.html) رمزهای اضافه شده در V2Ray 3.0): 
  * aes-256-cfb
  * aes-128-cfb
  * chacha20
  * chacha20-ietf
  * aes-256-gcm
  * aes-128-gcm
  * chacha20-poly1305 aka chacha20-ietf-poly1305
* پلاگینها: 
  * پشتیبانی obfs از طریق حالت مستقل.

## InboundConfigurationObject

```javascript
{
  "ایمیل": "love@v2ray.com"،
  "روش": "aes-128-cfb"،
  "رمز عبور": "رمز"،
  "سطح": 0،
  "ota": درست است
  "شبکه": "tcp"
)
```

> `ایمیل`: رشته

آدرس ایمیل. برای شناسایی کاربر استفاده می شود.

> `روش`: رشته

ضروری. مراجعه کنید به [روش رمزگذاری](#encryption-methods) برای مقادیر موجود.

> `رمز عبور`: رشته

ضروری. رمز عبور در پروتکل Shadowsocks. می تواند هر رشته باشد

> `سطح`: شماره

سطح کاربر پیش فرض به `0`. [سیاست](../policy.md).

> `ota`: `true` | `غلط`

آیا OTA مجبور است یا نه اگر `true` و اتصال ورودی OTA را فعال نکنند، V2Ray این اتصال را رد می کند. برعکس

اگر این فیلد مشخص نشده باشد، V2Ray خودکار تنظیمات OTA را از اتصالات ورودی تشخیص می دهد.

هنگامی که استفاده از رمزنگاری AEAD استفاده می شود `ota` تاثیری ندارد.

> `شبکه`: "tcp" | "udp" | "tcp، udp"

نوع شبکه های پشتیبانی شده پیش فرض به `"tcp"`.

## OutboundConfigurationObject

```javascript
{
  "سرورها": [
    {
      'ایمیل': "love@v2ray.com"،
      "آدرس": "127.0.0.1"،
      "پورت": 1234،
      "روش": "روش"،
      "password": "password"،
      "ota": false،
      "level": 0
    }
  ]
}
```

جایی که:

* `ایمیل`: آدرس ایمیل. برای شناسایی کاربر استفاده می شود.
* `آدرس`: آدرس سرور Shadowsocks. می تواند IPv4، IPv6 یا دامنه باشد.
* `پورت`: Port of Shadowsocks server.
* `روش`: روش رمزگذاری مقدار پیش فرض ندارد گزینه ها عبارتند از: 
  * `"aes-256-cfb"`
  * `"aes-128-cfb"`
  * `"chacha20"`
  * `"chacha20-ietf"`
  * `"aes-256-gcm"`
  * `"aes-128-gcm"`
  * `"chacha20-poly1305"` یا `"chacha20-ietf-poly1305"`
* `رمز عبور`: رمز عبور. می تواند هر رشته باشد
* `ota`: استفاده یا عدم استفاده از OTA. 
  * وقتی AEAD استفاده می شود، `ota` تاثیری ندارد.
* `سطح`: سطح کاربر.

> `سرور`: \ [[ServerObject](#serverobject)\]

آرایه ای از [ServerObject](#serverobject)ثانیه.

### ServerObject

```javascript
{
  "ایمیل": "love@v2ray.com"،
  "آدرس": "127.0.0.1"،
  "پورت": 1234،
  "روش": "加密 方式"،
  "رمز عبور": "密码" ،
  "ota": false،
  "level": 0
}
```

> `ایمیل`: رشته

آدرس ایمیل. برای شناسایی کاربر استفاده می شود.

> `آدرس`: آدرس

ضروری. آدرس سرور Shadowsocks. ممکن است IPv4، IPv6 یا آدرس دامنه باشد.

> `پورت`: شماره

ضروری. پورت سرور Shadowsocks.

> `روش`: رشته

ضروری. مراجعه کنید به [روش رمزگذاری](#encryption-methods) برای مقادیر موجود.

> `رمز عبور`: رشته

ضروری. رمز عبور در پروتکل Shadowsocks. می تواند هر رشته باشد

> `ota`: true | نادرست

استفاده یا عدم استفاده از OTA مقدار پیش فرض است `کاذب`.

وقتی رمزگذاری AEAD استفاده می شود، این فیلد تاثیری ندارد.

> `سطح`: شماره

سطح کاربر

## روش های رمزگذاری

* `"aes-256-cfb"`
* `"aes-128-cfb"`
* `"chacha20"`
* `"chacha20-ietf"`
* `"aes-256-gcm"`
* `"aes-128-gcm"`
* `"chacha20-poly1305"` یا `"chacha20-ietf-poly1305"`