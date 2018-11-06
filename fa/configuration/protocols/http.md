---
refcn: chapter_02/protocols/http
refen: configuration/protocols/http
---
# HTTP

* نام: `http`
* نوع: ورودی

HTTP یک پروتکل برای اتصالات ورودی است. این سازگار با HTTP / 1.1 است.

## InboundConfigurationObject

```javascript
{
  "accounts": [
    {
      "user": "my-username",
      "pass": "my-password"
    }
  ],
  "allowTransparent": false,
  "userLevel": 0
}
```

> `حساب`: \ [[AccountObject](#accountobject)\]

آرایه ای که هر ورودی یک حساب است. به طور پیش فرض خالی است. اگر خالی نباشد، HTTP Basic Authentication برای درخواست های ورودی مورد نیاز است.

> `allowTransparent`: true | نادرست

اگر به `true`تنظیم شده باشد، تمام درخواست HTTP برای این ورودی ارسال خواهد شد پروکسی، از جمله درخواست غیر پروکسی.

> `userLevel`: number

سطح کاربر همه اتصالات این سطح را به اشتراک میگذارند.

### AccountObject

```javascript
{
  "user": "my-username",
  "pass": "my-password"
}
```

> `کاربر`: رشته

نام کاربری برای تأیید هویت HTTP

> `پاس`: رشته

رمز عبور برای احراز هویت HTTP.

{% hint style='info' %}

از تنظیمات زیر در لینوکس برای استفاده از پروکسی HTTP در جلسه فعلی استفاده کنید.

* `صادرات http_proxy = HTTP: //127.0.0.1: 8080/` (URL است با توجه به پیکربندی خود را برای تغییر)
* `صادرات https_proxy =$http_proxy`

{% endhint %}