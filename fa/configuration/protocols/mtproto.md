---
refcn: chapter_02/protocols/mtproto
refen: configuration/protocols/mtproto
---

# MTProto

* نام: `mtproto`
* نوع: ورودی / خروجی

پروکسی MTProto ویژه ویژه برای Telegram است. این شامل یک جفت پروکسی های ورودی و خروجی در V2Ray است. آنها معمولا برای ساخت یک پروکسی برای Telegram استفاده می شوند

در حال حاضر V2Ray تنها آدرس IPv4 سرور Telegram را پشتیبانی می کند.

## InboundConfigurationObject

```javascript
{
  "users": [{
    "email": "love@v2ray.com",
    "level": 0,
    "secret": "b0cbcef5a486d9636472ac27f8e11a9d"
  }]
}
```

> `کاربر`: \ [[UserObject](#userobject)\]

آرایه ای از کاربران. در حال حاضر فقط اولین کاربر موثر است.

### UserObject

```javascript
{
  "email": "love@v2ray.com",
  "level": 0,
  "secret": "b0cbcef5a486d9636472ac27f8e11a9d"
}
```

> `ایمیل`: رشته

ایمیل کاربر مورد استفاده برای اهداف ردیابی دیدن [آمار](../stats.md).

> `سطح`: شماره

سطح کاربر

> `مخفی`: رشته

مخفی کاربر در Telegram، رمزعبور باید 32 حرف طول داشته باشد و فقط شامل صفات بین `0` تا `9`و `A`تا `ف`باشد.

{% hint style='tip' %}

شما می توانید از دستور زیر برای ایجاد مخفی MTProto استفاده کنید: `openssl rand -hex 16`

{% endhint %}

## پیکربندی خروجی {#outbound}

```javascript
{
}
```

## نمونه {#sample}

MTProto تنها می تواند برای ترافیک Telegram استفاده شود. شما ممکن است نیاز به یک قانون مسیریابی برای ترکیب ورودی و خروجی مربوطه داشته باشید. در اینجا یک نمونه ناقص است.

ورودی:

```javascript
{
  "tag": "tg-in",
  "port": 443,
  "protocol": "mtproto",
  "settings": {
    "users": [{"secret": "b0cbcef5a486d9636472ac27f8e11a9d"}]
  }
}
```

خروجی:

```javascript
{
  "tag": "tg-out",
  "protocol": "mtproto",
  "settings": {}
}
```

مسیریابی:

```javascript
{
  "type": "field",
  "inboundTag": ["tg-in"],
  "outboundTag": "tg-out"
}
```

برنامه Telegram خود را برای اتصال به port 443 در این دستگاه پیکربندی کنید.