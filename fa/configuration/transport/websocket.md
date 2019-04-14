---
refcn: chapter_02/transport/websocket
refen: configuration/transport/websocket
---
# وبسایت

از WebSocket استاندارد برای انتقال اطلاعات استفاده کنید. اتصالات Websocket می تواند توسط HTTP سرور مانند Nginx پروکسی.

## WebSocketObject

`WebSocketObject` به عنوان `wsSettings` در `TransportObject` یا `StreamSettingsObject`.

{% hint style='info' %}

Websocket HTTP header X-Forwarded-For را شناسایی می کند و از آن به عنوان آدرس منبع ورودی استفاده می کند.

{% endhint %}

```javascript
{
  "مسیر": "/"،
  "هدر": {
    "میزبان": "v2ray.com"
  }
}
```

> `مسیر`: رشته

مسیر مورد استفاده برای WebSocket. پیش فرض برای ریشه، به عنوان `"/"`.

> `هدر`: نقشه{string, string}

هدر سفارشی HTTP آرایه ای که هر ورودی یک جفت ارزش کلیدی در رشته است، برای هدر و مقدار در هدر HTTP. پیش فرض خالی است