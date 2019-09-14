---
refcn: chapter_02/protocols/vmess
refen: configuration/protocols/vmess
---

# VMess

* Name: `shadowsocks`
* Type: Inbound / Outbound

[VMess](https://www.v2ray.com/eng/protocols/vmess.html) یک پروتکل برای ارتباطات رمز شده است. این شامل پروکسی ورودی و خروجی است.

VMess به زمان سیستم بستگی دارد. لطفا اطمینان حاصل کنید که زمان سیستم شما همگام با زمان UTC است. منطقه زمانی مهم نیست ممکن است یک سرویس `ntp` در لینوکس برای تنظیم زمان سیستم به طور خودکار نصب شود.

## OutboundConfigurationObject

```javascript
{
  "vnext": [
    {
      "address": "127.0.0.1",
      "port": 37192,
      "users": [
        {
          "id": "27848739-7e62-4138-9fd3-098a63964b6b",
          "alterId": 4,
          "security": "auto",
          "level": 0
        }
      ]
    }
  ]
}
```

> `vnext`: \ [ [ServerObject](#serverobject)]

یک آرایه، که هر عنصر یک سرور از راه دور را ارائه می دهد

### ServerObject

```javascript
{
  "address": "127.0.0.1",
  "port": 37192,
  "users": []
}
```

> `آدرس`: آدرس

آدرس سرور، ممکن است IPv4، IPv6 یا نام دامنه باشد.

> `پورت`: شماره

پورت سرور

> `کاربر`: \ [ [UserObject](#userobject)\]

آرایه ای که هر عنصر یک کاربر VMess است

### UserObject

```javascript
{
  "id": "27848739-7e62-4138-9fd3-098a63964b6b",
  "alterId": 16,
  "security": "auto",
  "level": 0
}
```

> `id`: رشته

شناسه کاربر، به شکل یک UUID U [](https://en.wikipedia.org/wiki/Universally_unique_identifier).

> `alterId`: شماره

Number of alternative IDs. The alternative IDs will be generated in a deterministic way. Default to 0. Maximum 65535. Recommend 4. Its value must be not larger than the one in corresponding Inbound.

> `سطح`: شماره

سطح کاربر برای کسب اطلاعات بیشتر به [سیاست](../policy.md) مراجعه کنید.

> `امنیت`: "aes-128-gcm" | "chacha20-poly1305" | "خودکار" | "هیچ یک"

روش رمزگذاری بار. این تنظیم فقط در خارج از دسترس است. ورودی VMess به طور خودکار این تنظیم را تشخیص داده و سپس مقدار رمزگشایی را رمزگشایی می کند. گزینه ها عبارتند از:

* `"aes-128-gcm"`: توصیه شده برای کامپیوتر.
* `"chacha20-poly1305"`: توصیه شده برای موبایل.
* `"auto"`: مقدار پیش فرض. استفاده از `aes-128-gcm` در AMD64، ARM64 و S390x یا `chacha20-poly1305` در غیر این صورت.
* `"none"`: ترافیک در همه رمزگذاری نشده است.

{% hint style='info' %}

از سازگاری بهتر برای استفاده از `"خودکار"` استفاده کنید.

{% endhint %}

## InboundConfigurationObject

```javascript
{
  "clients": [
    {
      "id": "27848739-7e62-4138-9fd3-098a63964b6b",
      "level": 0,
      "alterId": 4,
      "email": "love@v2ray.com"
    }
  ],
  "default": {
    "level": 0,
    "alterId": 4
  },
  "detour": {
    "to": "tag_to_detour"
  },
  "disableInsecureEncryption": false
}
```

> `مشتری`: \ [ [ClientObject](#clientobject)\]

یک آرایه برای حساب کاربری معتبر. ممکن است هنگام استفاده از ویژگی پورت پویا خالی باشد.

> `تور`: [DetourObject](#detourobject)

ویژگی اختیاری برای نشان دادن مشتری برای دور زدن. اگر مشخص شود، این ورودی، خروجی را برای استفاده از ورودی دیگر هدایت می کند.

> `طور پیش فرض`: [DefaultObject](#defaultobject)

پیکربندی مشتری پیش فرض اختیاری معمولا با `دور`.

> `disableInsecureEncryption`: true | نادرست

مشتری را برای استفاده از روش های رمزنگاری ناامن ممنوع می کند. هنگامی که به `true`، اتصالات بلافاصله فسخ خواهند شد اگر رمزگذاری زیر استفاده شود. مقدار پیش فرض `false`.

* `هیچ یک`
* `aes-128-cfb`

### ClientObject

```javascript
{
  "id": "27848739-7e62-4138-9fd3-098a63964b6b",
  "level": 0,
  "alterId": 4,
  "email": "love@v2ray.com"
}
```

> `id`: رشته

شناسه کاربر، به شکل [UUID](https://en.wikipedia.org/wiki/Universally_unique_identifier).

> `سطح`: شماره

سطح کاربر برای استفاده از آن [سیاست](../policy.md) ببینید.

> `alterId`: شماره

تعداد شناسه های جایگزین همانطور که در خارج از کشور است.

> `ایمیل`: رشته

آدرس ایمیل برای شناسایی کاربر

### DetourObject

```javascript
{
  "to": "tag_to_detour"
}
```

> `تا`: رشته

برچسب یک پروکسی ورودی مشاهده [بررسی](../protocols.md). در صورت پیکربندی، VMess مشتری خود را پیشنهاد می دهد که از اتصال برای ارتباطات بیشتر استفاده کند.

### DefaultObject

```javascript
{
  "level": 0,
  "alterId": 4
}
```

> `سطح`: شماره

سطح کاربر

> `alterId`: شماره

Number of alternative IDs. Default value 64. Recommend 4.