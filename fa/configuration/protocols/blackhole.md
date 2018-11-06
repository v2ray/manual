---
refcn: chapter_02/protocols/blackhole
refen: configuration/protocols/blackhole
---
# سیاه چاله

* نام: `blackhole`
* نوع: خروجی

Blackhole یک پروتکل برای ارتباطات خروجی است. این همه اتصالات با پاسخ های از پیش تعیین شده را مسدود می کند. همراه با [مسیریابی](../routing.md)، این می تواند برای جلوگیری از دسترسی به برخی از وب سایت ها استفاده شود.

## ConfigurationObject

```javascript
{
  "response": {
    "type": "none"
  }
}
```

> `پاسخ`: [ResponseObject](#responseobject)

پاسخ از پیش تعیین شده Blockhole بلافاصله برای هر ارتباطی که به آن انتقال داده می شود (اگر داده شده است) داده شود و اتصال را متوقف کند.

### ResponseObject

```javascript
{
  "type": "none"
}
```

> `نوع`: "هیچ" | "http"

نوع پاسخ، گزینه های موجود عبارتند از:

* `"none"`: مقدار پیش فرض. پاسخ خالی
* `"http"`: پاسخ معتبر HTTP 403.