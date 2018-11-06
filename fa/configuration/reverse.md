---
refcn: chapter_02/reverse
refen: configuration/reverse
---
# معکوس پروکسی

معکوس پروکسی یک ویژگی اختیاری در V2Ray است. این ترافیک را از یک سرور به یک مشتری منتقل می کند. بنابراین پروکسی معکوس معکوس است.

{% hint style='tip' %}

معکوس پروکسی در V2Ray 4.0+ در دسترس است. این در حال حاضر در بتا است و ممکن است در آینده نزدیک بهبود یابد.

{% endhint %}

معکوس پروکسی به روش زیر عمل می کند:

* فرض کنید یک دستگاه A است که یک سرور وب را اجرا می کند. دستگاه A هیچ آدرس IP عمومی ندارد و نمی تواند از طریق اینترنت دسترسی پیدا کند. یک دستگاه دیگر B وجود دارد، می گوید یک سرور ابر، که می تواند از اینترنت دسترسی داشته باشد. ما نیاز به استفاده از B به عنوان پورتال، جهت هدایت تراکنش به A
* حالا ما V2Ray را بر روی دستگاه A نصب می کنیم که `پل`. و سپس V2Ray را بر روی دستگاه B نصب کنید، به نام `پورت`.
* `پل` اتصال به `پورتال`را باز می کند. هدف خود را می توان برای مقصد مسیریابی سفارشی. `پورتال` ، این اتصالات، و همچنین اتصالات از دیگر کاربردهای اینترنتی را دریافت خواهد کرد. `پورتال` این دو نوع اتصالات را "اتصال" می کند. سپس ترافیک داخلی به `پل`تونل می شود.
* پس از `پل` ترافیک از اینترنت را از طریق `پورت`دریافت می کند، این ترافیک را به سرور وب در localhost ارسال می کند. شما همچنین می توانید مسیریابی را برای این ترافیک نیز پیکربندی کنید.
* `پل` توازن بار را براساس میزان ترافیک کنترل می کند.

{% hint style='danger' %}

معکوس پروکسی در حال حاضر قدرت [Mux](mux.md). لازم نیست دوباره Mux را روی خروجی آن پیکربندی کنید.

{% endhint %}

## ReverseObject

`ReverseObject` به عنوان `معکوس` فیلد در پیکربندی سطح بالا استفاده می شود.

```javascript
{
  "bridges": [{
    "tag": "bridge",
    "domain": "test.v2ray.com"
  }],
  "portals": [{
    "tag": "portal",
    "domain": "test.v2ray.com"
  }]
}
```

> `پل`: \ [[BridgeObject](bridgeobject)]

آرایه ای از `پل`ثانیه. هر `پل` است [BridgeObject](bridgeobject).

> `پورتال`: \ [[PortalObject](portalobject)]

آرایه ای از `پورتال`ثانیه. هر `پورتال` است [PortalObject](bridgeobject).

### BridgeObject

```javascript
{
  "tag": "bridge",
  "domain": "test.v2ray.com"
}
```

> `برچسب`: رشته

تگ تمام ترافیک آغاز شده توسط این `پل` این برچسب را دارند. این می تواند برای مسیر [](routing.md)، که به عنوان `inboundTag`.

> `دامنه`: رشته

دامنه تمام اتصالات آغاز شده توسط `پل` به سمت `پورتال` از این دامنه به عنوان هدف استفاده می کنند. این دامنه فقط برای ارتباط بین `پل` و `پورتال`. لازم نیست در واقع ثبت نام شود.

### PortalObject

> `برچسب`: رشته

یک برچسب شما نیاز به تغییر مسیر تمام ترافیک به این `پورتال`، با هدف قرار دادن `outboundTag` این `تگ`. ترافیک شامل اتصالات از `پل`و همچنین ترافیک اینترنتی است.

> `دامنه`: رشته

دامنه هنگامی که یک ارتباط با هدف قرار دادن این دامنه، `پورتال` ، این ارتباط از `پل`، در غیر این صورت اتصال به اینترنت است.

{% hint style='tip' %}

مانند دیگر کاربرد، یک نمونه V2Ray می تواند به عنوان استفاده `پل`، و یا یک `پورتال`، یا هر دو به عنوان همان زمان.

{% endhint %}

## پیکربندی مثال

`پل` معمولا نیاز به دو خروجی دارد. یکی برای اتصال `پورتال`و دیگری برای اتصال سرور محلی محلی.

معکوس:

```javascript
{
  "bridges": [{
    "tag": "bridge",
    "domain": "test.v2ray.com"
  }]
}
```

خروجی:

```javascript
{
  "tag": "out"
  "protocol": "freedom",
  "settings": {
    "redirect": "127.0.0.1:80" // Send traffic to local web server
  }
},
{
  "protocol": "vmess",
  "settings": {
    "vnext": [{
      "address": "portal的IP地址",
      "port": 1024,
      "users": [{"id": "27848739-7e62-4138-9fd3-098a63964b6b"}]
    }]
  },
  "tag": "interconn"
}
```

مسیریابی:

```javascript
"routing": {
  "strategy": "rules",
  "settings": {
    "rules": [{
      "type": "field",
      "inboundTag": ["bridge"],
      "domain": ["full:test.v2ray.com"],
      "outboundTag": "interconn"
    },{
      "type": "field",
      "inboundTag": ["bridge"],
      "outboundTag": "out"
    }]
  }
}
```

`پورتال` معمولا نیاز به دو inbounds دارد. یکی برای اتصالات از `پل`و دیگری برای اتصال به اینترنت.

معکوس:

```javascript
{
  "portals": [{
    "tag": "portal",
    "domain": "test.v2ray.com"  // Must be the same as in bridge
  }]
}
```

Inbound:

```javascript
{
  "tag": "external",
  "port": 80,  // Open port 80 for internet HTTP traffic
  "protocol": "dokodemo-door",
  "settings": {
    "address": "127.0.0.1",
    "port": 80,
    "network": "tcp"
  }
},
{
  "port": 1024, // For bridge connections
  "tag": "interconn",
  "protocol": "vmess",
  "settings": {
    "clients": [{"id": "27848739-7e62-4138-9fd3-098a63964b6b"}]
  }
}
```

Routing:

```javascript
"routing": {
  "strategy": "rules",
  "settings": {
    "rules": [{
      "type": "field",
      "inboundTag": ["external"],
      "outboundTag": "portal"
    },{
      "type": "field",
      "inboundTag": ["interconn"],
      "outboundTag": "portal"
    }]
  }
}
```

{% hint style='tip' %}

در عمل، شما ممکن است بخواهید اول `پل` و سپس `پورت`.

{% endhint %}