---
refcn: chapter_02/05_transport
refen: configuration/transport
---
# تنظیمات حمل و نقل

حمل و نقل این است که چگونه V2Ray ارسال و دریافت داده ها از همتایان خود را. The responsibility of a transport is to reliably transfer data to a peer. معمولا یک ارتباط با ترانسپورت در هر دو نقطه انتهایی دارد. به عنوان مثال، اگر یک خروجی V2Ray با استفاده از WebSocket به عنوان حمل و نقل آن، ورودی آن صحبت می کند، همچنین باید از WebSocket استفاده کند، در غیر این صورت یک اتصال نمی تواند برقرار شود.

تنظیمات حمل و نقل به دو قسمت تقسیم می شود: تنظیمات جهانی و تنظیمات پراکسی. تنظیمات هر پروکسی مشخص می کند که چگونه هر یک از پروکسی ها اطلاعات خود را مدیریت می کند، در حالی که تنظیمات جهانی برای همه پروکسی ها است. معمولا پروکسی های ورودی و خروجی بین همتراز اتصال باید تنظیمات حمل و نقل مشابه داشته باشند. هنگامی که یک پروکسی هیچ تنظیمات حمل و نقل ندارد، تنظیمات جهانی اعمال می شود.

## TransportObject

`TransportObject` به عنوان `انتقال` فیلد در پیکربندی سطح بالا استفاده می شود.

```javascript
{
  "tcpSettings": {},
  "kcpSettings": {},
  "wsSettings": {},
  "httpSettings": {},
  "dsSettings": {}
}
```

> `tcpSettings`: TcpObject

تنظیمات [TCP transport](transport/tcp.md).

> `kcpSettings`: KcpObject

تنظیمات حمل و نقل [mKCP](transport/mkcp.md).

> `wsSettings`: WebSocketObject

تنظیمات برای [حمل و نقل WebSocket](transport/websocket.md).

> `httpSettings`: HttpObject

تنظیمات [HTTP / 2 حمل و نقل](transport/h2.md).

> `dsSettings`: DomainSocketObject

تنظیمات برای [Domain Socket Transport](transport/domainsocket.md).

## StreamSettingsObject

هر پروکسی ورودی و خروجی ممکن است تنظیمات حمل و نقل خود را داشته باشد، همانطور که در `جریان تنظیمات` در پیکربندی سطح بالا مشخص شده است.

```javascript
{
  "شبکه": "tcp"،
  "امنیت": "هیچ"،
  "tlsSettings": {}،
  "tcpSettings": {}،
  "kcpSettings": {}،
  wsSettings: {} ،
  "httpSettings": {}،
  "dsSettings": {}،
  "sockopt": {
    "علامت": 0،
    "tcpFastOpen": false،
    "tproxy": "off"
  }
}
```

> `شبکه`: "tcp" | "kcp" | "ws" | "http" | "domainsocket"

نوع شبکه حمل و نقل جریان. مقدار پیش فرض `"tcp"`.

> `امنیت`: "هیچ" | "TLS"

نوع امنیت انتخاب ها `"هیچ"` (پیش فرض) برای امنیت فوق العاده، و یا `"TLS"` برای استفاده از [TLS](https://en.wikipedia.org/wiki/Transport_Layer_Security).

> `tlsSettings`: [TLSObject](#tlsobject)

تنظیمات TLS TLS توسط Golang ارائه شده است. پشتیبانی از TLS 1.2. DTLS پشتیبانی نمی شود

> `tcpSettings`: [TcpObject](transport/tcp.md)

پیکربندی TCP انتقال برای پروکسی فعلی. فقط زمانی که پروکسی از حمل و نقل TCP استفاده می کند موثر است. پیکربندی همان است که در تنظیمات جهانی است.

> `kcpSettings`: KcpObject

پیکربندی mKCP حمل و نقل برای پروکسی فعلی. تنها زمانی که پروکسی از حمل و نقل mKCP استفاده می کند موثر است. پیکربندی همان است که در تنظیمات جهانی است.

> `wsSettings`: WebSocketObject

پیکربندی حمل و نقل WebSocket برای پروکسی فعلی. تنها زمانی که پروکسی از حمل و نقل WebSocket استفاده می کند موثر است. پیکربندی همان است که در تنظیمات جهانی است.

> `httpSettings`: HttpObject

پیکربندی HTTP / 2 حمل و نقل برای پروکسی فعلی. فقط زمانی که پروکسی از HTTP / 2 استفاده می کند موثر باشد. پیکربندی همان است که در تنظیمات جهانی است.

> `dsSettings`: DomainSocketObject

پیکربندی سوکت دامنه برای پروکسی فعلی. فقط زمانی که پروکسی از حمل سوکت دامنه استفاده می کند، موثر است.

> `sockopt`: SockoptObject

گزینه سوکت برای اتصالات ورودی و خروجی.

### TLSObject

```javascript
{
  "serverName": "v2ray.com",
  "allowInsecure": false,
  "alpn": ["http/1.1"],
  "certificates": []
}
```

> `servername`: string

نام سرور (معمولا دامنه) برای احراز هویت TLS استفاده می شود. به طور معمول این زمانی استفاده می شود که پاسخ های ورودی / خروجی از IP برای ارتباطات استفاده می شود.

> `alpn`: \ [رشته \]

آرایه ای از رشته ها، برای مشخص کردن مقدار ALPN در دست TLS. مقدار پیش فرض `["http / 1.1"]`.

> `allowInsecure`: true | نادرست

اگر `درست`باشد، V2Ray اجازه اتصال غیر امن را در سرویس گیرنده TLS می دهد، به عنوان مثال، سرور TLS با استفاده از گواهینامه های قابل تایید استفاده می کند.

> `allowInsecureCiphers`: true | نادرست

خنثی کردن یا اجازه دادن به سوئیت های رمزنگاری ناامن. به طور پیش فرض TLS تنها از سوکت های سیر از TLS 1.3 استفاده می کند. این گزینه را فعال کنید تا سوئیت های رمز را با کلید های ثابت RSA فعال کنید.

> `گواهینامه`: \ [ [CertificateObject](#certificateobject)\]

فهرست گواهی TLS. هر ورودی یک گواهی است

### CertificateObject

```javascript
{
  "usage": "encipherment",

  "certificateFile": "/path/to/certificate.crt",
  "keyFile": "/path/to/key.key",

  "certificate": [
    "-----BEGIN CERTIFICATE-----",
    "MIICwDCCAaigAwIBAgIRAO16JMdESAuHidFYJAR/7kAwDQYJKoZIhvcNAQELBQAw",
    "ADAeFw0xODA0MTAxMzU1MTdaFw0xODA0MTAxNTU1MTdaMAAwggEiMA0GCSqGSIb3",
    "DQEBAQUAA4IBDwAwggEKAoIBAQCs2PX0fFSCjOemmdm9UbOvcLctF94Ox4BpSfJ+",
    "3lJHwZbvnOFuo56WhQJWrclKoImp/c9veL1J4Bbtam3sW3APkZVEK9UxRQ57HQuw",
    "OzhV0FD20/0YELou85TwnkTw5l9GVCXT02NG+pGlYsFrxesUHpojdl8tIcn113M5",
    "pypgDPVmPeeORRf7nseMC6GhvXYM4txJPyenohwegl8DZ6OE5FkSVR5wFQtAhbON",
    "OAkIVVmw002K2J6pitPuJGOka9PxcCVWhko/W+JCGapcC7O74palwBUuXE1iH+Jp",
    "noPjGp4qE2ognW3WH/sgQ+rvo20eXb9Um1steaYY8xlxgBsXAgMBAAGjNTAzMA4G",
    "A1UdDwEB/wQEAwIFoDATBgNVHSUEDDAKBggrBgEFBQcDATAMBgNVHRMBAf8EAjAA",
    "MA0GCSqGSIb3DQEBCwUAA4IBAQBUd9sGKYemzwPnxtw/vzkV8Q32NILEMlPVqeJU",
    "7UxVgIODBV6A1b3tOUoktuhmgSSaQxjhYbFAVTD+LUglMUCxNbj56luBRlLLQWo+",
    "9BUhC/ow393tLmqKcB59qNcwbZER6XT5POYwcaKM75QVqhCJVHJNb1zSEE7Co7iO",
    "6wIan3lFyjBfYlBEz5vyRWQNIwKfdh5cK1yAu13xGENwmtlSTHiwbjBLXfk+0A/8",
    "r/2s+sCYUkGZHhj8xY7bJ1zg0FRalP5LrqY+r6BckT1QPDIQKYy615j1LpOtwZe/",
    "d4q7MD/dkzRDsch7t2cIjM/PYeMuzh87admSyL6hdtK0Nm/Q",
    "-----END CERTIFICATE-----"
  ],
  "key": [
    "-----BEGIN RSA PRIVATE KEY-----",
    "MIIEowIBAAKCAQEArNj19HxUgoznppnZvVGzr3C3LRfeDseAaUnyft5SR8GW75zh",
    "bqOeloUCVq3JSqCJqf3Pb3i9SeAW7Wpt7FtwD5GVRCvVMUUOex0LsDs4VdBQ9tP9",
    "GBC6LvOU8J5E8OZfRlQl09NjRvqRpWLBa8XrFB6aI3ZfLSHJ9ddzOacqYAz1Zj3n",
    "jkUX+57HjAuhob12DOLcST8np6IcHoJfA2ejhORZElUecBULQIWzjTgJCFVZsNNN",
    "itieqYrT7iRjpGvT8XAlVoZKP1viQhmqXAuzu+KWpcAVLlxNYh/iaZ6D4xqeKhNq",
    "IJ1t1h/7IEPq76NtHl2/VJtbLXmmGPMZcYAbFwIDAQABAoIBAFCgG4phfGIxK9Uw",
    "qrp+o9xQLYGhQnmOYb27OpwnRCYojSlT+mvLcqwvevnHsr9WxyA+PkZ3AYS2PLue",
    "C4xW0pzQgdn8wENtPOX8lHkuBocw1rNsCwDwvIguIuliSjI8o3CAy+xVDFgNhWap",
    "/CMzfQYziB7GlnrM6hH838iiy0dlv4I/HKk+3/YlSYQEvnFokTf7HxbDDmznkJTM",
    "aPKZ5qbnV+4AcQfcLYJ8QE0ViJ8dVZ7RLwIf7+SG0b0bqloti4+oQXqGtiESUwEW",
    "/Wzi7oyCbFJoPsFWp1P5+wD7jAGpAd9lPIwPahdr1wl6VwIx9W0XYjoZn71AEaw4",
    "bK4xUXECgYEA3g2o9WqyrhYSax3pGEdvV2qN0VQhw7Xe+jyy98CELOO2DNbB9QNJ",
    "8cSSU/PjkxQlgbOJc8DEprdMldN5xI/srlsbQWCj72wXxXnVnh991bI2clwt7oYi",
    "pcGZwzCrJyFL+QaZmYzLxkxYl1tCiiuqLm+EkjxCWKTX/kKEFb6rtnMCgYEAx0WR",
    "L8Uue3lXxhXRdBS5QRTBNklkSxtU+2yyXRpvFa7Qam+GghJs5RKfJ9lTvjfM/PxG",
    "3vhuBliWQOKQbm1ZGLbgGBM505EOP7DikUmH/kzKxIeRo4l64mioKdDwK/4CZtS7",
    "az0Lq3eS6bq11qL4mEdE6Gn/Y+sqB83GHZYju80CgYABFm4KbbBcW+1RKv9WSBtK",
    "gVIagV/89moWLa/uuLmtApyEqZSfn5mAHqdc0+f8c2/Pl9KHh50u99zfKv8AsHfH",
    "TtjuVAvZg10GcZdTQ/I41ruficYL0gpfZ3haVWWxNl+J47di4iapXPxeGWtVA+u8",
    "eH1cvgDRMFWCgE7nUFzE8wKBgGndUomfZtdgGrp4ouLZk6W4ogD2MpsYNSixkXyW",
    "64cIbV7uSvZVVZbJMtaXxb6bpIKOgBQ6xTEH5SMpenPAEgJoPVts816rhHdfwK5Q",
    "8zetklegckYAZtFbqmM0xjOI6bu5rqwFLWr1xo33jF0wDYPQ8RHMJkruB1FIB8V2",
    "GxvNAoGBAM4g2z8NTPMqX+8IBGkGgqmcYuRQxd3cs7LOSEjF9hPy1it2ZFe/yUKq",
    "ePa2E8osffK5LBkFzhyQb0WrGC9ijM9E6rv10gyuNjlwXdFJcdqVamxwPUBtxRJR",
    "cYTY2HRkJXDdtT0Bkc3josE6UUDvwMpO0CfAETQPto1tjNEDhQhT",
    "-----END RSA PRIVATE KEY-----"
  ]
}
```

> `استفاده`: "فریبندگی" | "تأیید" | "موضوع"

هدف گواهی مقدار پیش فرض `"تکه تکه شدن"`. انتخاب ها عبارتند از:

* `"رمزگذاری"`: گواهی برای احراز هویت و رمزگذاری TLS استفاده می شود.
* `"verify"`: گواهی برای اعتبار سنجی گواهی TLS از همکار راه دور استفاده می شود. در این مورد گواهی باید یک گواهینامه CA باشد.
* `"issue"`: گواهی برای صدور گواهی های دیگر استفاده می شود. در این مورد گواهی باید یک گواهینامه CA باشد.

{% hint style='info' %}

در ویندوز، شما باید گواهینامه CA خود را به سیستم، برای تأیید مدارک صادر شده از CA، نصب کنید.

{% endhint %}

{% hint style='info' %}

هنگامی که یک درخواست مشتری جدید وجود دارد، برای `serverName` = `«v2ray.com»`بگویید، V2Ray گواهی `برای v2ray.com` پیدا خواهد کرد. اگر پیدا نشد، V2Ray سعی خواهد کرد که گواهی جدیدی را با استفاده از هر گواهی موجود که `استفاده` است `"issue"` برای `"v2ray.com"`. گواهینامه جدید در یک ساعت منقضی می شود و برای مجوز استفاده مجدد به مجوز گواهی اضافه می شود.

{% endhint %}

> `certificateFile`: string

مسیر فایل به گواهی اگر گواهی توسط OpenSSL تولید شود، مسیر با ".crt" به پایان می رسد.

{% hint style='info' %}

استفاده از `v2ctl CERT -ca` دستور برای تولید یک گواهی CA جدید است.

{% endhint %}

> `گواهی`: \ [رشته \]

فهرست رشته ها به عنوان محتویات گواهی. مثال بالا را ببینید گواهی `یا گواهی` یا `certificateFile` نباید خالی باشد.

> `keyFile`: string

مسیر فایل به کلید خصوصی. اگر با OpenSSL تولید می شود، فایل معمولا با ".key" به پایان می رسد. فایل کلید با رمز عبور پشتیبانی نمی شود

> `کلید`: \ [رشته \]

فهرست رشته ها به عنوان محتویات کلید خصوصی. مثال بالا را ببینید هر کدام `کلید` یا `keyFile` نباید خالی باشد.

هنگامی که `گواهینامه` و `گواهی` هر دو پر شده است. V2Ray با استفاده از `certificateFile`. همان `keyFile` و `کلید`.

{% hint style='info' %}

هنگامی که `استفاده` `«تأیید»`، هر دو `KeyFile` و `کلید` می توانند خالی باشند.

{% endhint %}

### SockoptObject

```javascript
{
  "mark": 0,
  "tcpFastOpen": false,
  "tproxy": "off"
}
```

> `علامت`: شماره

یک عدد صحیح اگر غیر صفر باشد، مقدار از طریق گزینه سوکت SO_MARK به اتصالات خروجی تنظیم خواهد شد. این مکانیزم تنها در لینوکس اعمال می شود و نیازمند اجازه CAP_NET_ADMIN است.

> `tcpFastOpen`: true | نادرست

یا این که آیا برای فعال [TCP سریع گسترش](https://en.wikipedia.org/wiki/TCP_Fast_Open). هنگامی که به `درست`تنظیم می شود، V2Ray TFO را برای اتصال فعلی فراهم می کند. هنگامی که به `false`، V2Ray TFO را غیرفعال می کند. اگر این ورودی وجود ندارد، V2Ray از تنظیمات پیش فرض از سیستم عامل استفاده می کند.

* فقط در سیستم عامل های زیر اعمال می شود: 
  * ویندوز 10 (1604) یا بعدا
  * سیستم عامل مک 10.11 / iOS 9 یا بالاتر
  * لینوکس 3.16 یا بالاتر: به طور پیش فرض توسط سیستم فعال شده است.
* قابل اجرا برای اتصالات ورودی و خروجی.

> `tproxy`: "تغییر مسیر" | "tproxy" | "خاموش"

آیا پروکسی شفاف را در لینوکس فعال کنید یا خیر. انتخاب ها عبارتند از:

* `"خاموش"`: مقدار پیش فرض. TProxy را فعال نکنید.
* `"redirect"`: فعال کردن TProxy با حالت Redirect پشتیبانی از ترافیک TCP / IPv4 و UDP.
* `"tproxy"`: TProxy را با حالت TProxy فعال کنید. پشتیبانی از ترافیک TCP و UDP.

پروکسی شفاف نیاز به مجوز ریشه یا CAP \ _NET \ _ADMIN دارد.

{% hint style='info' %}

اگر `TProxy` تنظیم نشده باشد، و `allowRedirect` در [dokodemo door](protocols/dokodemo.md)، مقدار `TProxy` به صورت خودکار به `"redirect"` تنظیم خواهد شد.

{% endhint %}