---
refcn: chapter_02/protocols/freedom
refen: configuration/protocols/freedom
---
# Freedom

* نام: `آزادی`
* نوع: خروجی

آزادی یک پروتکل برای ارتباطات خروجی است این تمام اتصال TCP یا UDP را به مقصد خود منتقل می کند. این خروجی زمانی استفاده می شود که می خواهید ترافیک را به مقصد واقعی خود ارسال کنید.

## ConfigurationObject

```javascript
{
  "domainStrategy": "AsIs",
  "redirect": "127.0.0.1:3366",
  "userLevel": 0
}
```

> `domainStrategy`: "AsIs" | "UseIP"

استراتژی برای حل و فصل نام دامنه. گزینه ها عبارتند از:

* `"AsIs"`: مقدار پیش فرض. تعیین نام دامنه توسط سیستم
* `"UseIP"`: استفاده از [DNS داخلی](../dns.md) برای وضوح نام دامنه.

(V2Ray 4.6+) In `UseIP` mode, when `sendThrough` is specified in [OutboundObject](../overview.md#outboundobject), Freedom will automatically choose between IPv4 and IPv6 address for destination based on `sendThrough` settings.

> `redirect`: address_port

Redirect all connections to this address, in form like `"127.0.0.1:80"` or `":1234"`.

* وقتی آدرس خالی است، به عنوان مثال `": 443"`، Freedom از آدرس اصلی اصلی استفاده می کند.
* هنگامی که پورت `0`، به عنوان مثال `"v2ray.com:0"`، آزادی را به پورت اصلی استفاده کنید.

> `userLevel`: number

User level. All connections share this level.