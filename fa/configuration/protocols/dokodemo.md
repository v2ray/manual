* * *

refcn: chapter_02/protocols/dokodemo refen: configuration/protocols/dokodemo

* * *

# Dokodemo-door

* نام: `dokodemo-door`
* نوع: ورودی

Dokodemo درب یک پروتکل برای اتصالات ورودی است. هر ارتباطی را می گیرید و آنها را به مقصد مشخص شده منتقل می کنید.

Dokodemo درب همچنین (اگر پیکربندی شده) به عنوان یک پروکسی شفاف کار می کند.

## ConfigurationObject

```javascript
{
  "address": "8.8.8.8",
  "port": 53,
  "network": "tcp",
  "followRedirect": false,
  "userLevel": 0
}
```

> `آدرس`: آدرس

آدرس سرور مقصد ممکن است یک IPv4، IPv6 یا یک دامنه در فرم رشته باشد. هنگامی که `followRedirect` (زیر را ببینید) `true`، `آدرس` می تواند خالی باشد.

> `پورت`: شماره

پورت سرور مقصد

> `شبکه`: "tcp" | "udp" | "tcp، udp"

نوع شبکه قابل قبول اگر `"tcp"` مشخص شود، تمام ترافیک UDP فرستاده شده به این door doko-door حذف خواهد شد.

> `followrelated`: true | نادرست

هنگامی که به `true`تنظیم می شود، dokodemo-door مقصد را از TProxy تشخیص می دهد و از آن به عنوان مقصد استفاده می کند. `TProxy` در [حمل و نقل](../transport.md) برای جزئیات مشاهده کنید.

> `userLevel`: number

سطح کاربر همه اتصالات این سطح را به اشتراک میگذارند. برای جزئیات بیشتر به [سیاست](../policy.md) مراجعه کنید.

## نمونه هایی برای پروکسی شفاف

ورودی dokodemo door را به صورت زیر وارد کنید.

```javascript
{
  "شبکه": "tcp، udp"،
  "وقفه": 30،
  "followRedirect": true
}
```

پیکربندی iptables را به صورت زیر انجام دهید.

```bash
# ایجاد زنجیره ای جدید
iptables -t nat -N V2RAY
iptables -t انسداد -N V2RAY
iptables -t انحنا -N V2RAY_MARK

# آدرس سرور شما V2Ray را نادیده بگیرید
# بسیار مهم است، فقط مراقب باشید.
iptables -t nat -a V2RAY -d 123.123.123.123 -j بازگردانی

# نادیده گرفتن LAN ها و هر آدرس دیگری که می خواهید از پروکسی دور بشوید
# برای مشاهده لیست کامل شبکه های رزرو شده به ویکیپدیا و RFC5735 مراجعه کنید.
iptables -t nat -A V2RAY -d 0.0.0.0/8 -j RETURN
iptables -t nat -A V2RAY -d 10.0.0.0/8 -j RETURN
iptables -t nat -A V2RAY -d 127.0.0.0/8 -j RETURN
iptables -t nat -A V2RAY -d 169.254.0.0/16 -j RETURN
iptables -t nat -a V2RAY -d 172.16.0.0/12 -j RETURN
iptables -t nat -a V2RAY -d 192.168 .0.0 / 16 -j RETURN
iptables -t nat -A V2RAY -d 224.0.0.0/4 -j RETURN
iptables -t nat -A V2RAY -d 240.0.0.0/4 -j RETURN

# هر چیز دیگری باید هدایت شود به پورت محلی Dokodemo درب
iptables -t nat -A V2RAY -p tcp -j REDIRECT -to-ports 12345

# اضافه کردن هر قاعده UDP
مسیر IP اضافه کردن محلی محلی به طور پیش فرض lo loo 100
قانون آی پی اضافه کردن 1 جستجو 100
iptables -t mangle -A V2RAY -p udp -dport 53 -j TPROXY -on-port 12345 -tproxy-mark 0x01 / 0x01
iptables -t mangle -A V2RAY_MARK -p udp --dport 53 -j MARK -set-mark 1

# قوانین را اعمال می کند
iptables -t nat -A OUTPUT -p tcp -j V2RAY
iptables -t انسداد -A PREROUTING -j V2RAY
iptables -t انسداد -A OUTPUT -j V2RAY_MARK
```