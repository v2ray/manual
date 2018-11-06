---
refcn: chapter_00/start
refen: welcome/start
---
# شروع سریع

شما باید V2Ray را پس از نصب آن پیکربندی کنید. در اینجا یک پیکربندی سریع برای اجرا نسخه ی نمایشی است. لطفا برای تنظیمات پیشرفته تر [پیکربندی](../configuration/overview.md) ببینید.

## مشتری {#client}

در کامپیوتر شما (یا موبایل)، V2Ray را با تنظیمات زیر اجرا کنید.

```javascript
{
  "inbounds": [{
    "port": 1080,  // Port of socks5 proxy. مرورگر خود را برای استفاده از این پورت بنویسید
    "listen": "127.0.0.1",
    "protocol": "socks",
    "settings": {
      "udp": true
    }
  }],
  "outbounds": [{
    "protocol": "vmess",
    "settings": {
      "vnext": [{
        "address": "server", // Address of your V2Ray server. ممکن است نشانی IP یا آدرس دامنه باشد.
        "port": 10086,  // Port of your V2Ray server.
        "users": [{ "id": "b831381d-6324-4d53-ad4f-8cda48b30811" }]
      }]
    }
  },{
    "protocol": "freedom",
    "tag": "direct",
    "settings": {}
  }],
  "routing": {
    "strategy": "rules",
    "settings": {
      "domainStrategy": "IPOnDemand",
      "rules": [{
        "type": "field",
        "ip": ["geoip:private"],
        "outboundTag": "direct"
      }]
    }
  }
}
```

لطفا آدرس آی پی سرور V2Ray خود را همانطور که در بالا ذکر شد تغییر دهید. پس از آن، فرآیند V2Ray در رایانه شما تمام ترافیک سرور V2Ray را به جز ترافیک داخل شبکه پروکسی می کند.

## سرور {#server}

شما برای اجرای V2Ray به عنوان یک سرور نیاز به یک رایانه دیگر دارید. معمولا این کامپیوتر در خارج از فایروال قرار دارد. در اینجا یک پیکربندی نمونه است.

```javascript
{
  "inbounds": [{
    "پورت": 10086، // پورت سرور. باید همانند بالا باشد.
    "پروتکل": "vmess"،
    "تنظیمات": {
      "مشتری": [{"id": "b831381d-6324-4d53-ad4f-8cda48b30811"}]
    }
  }]،
  خروجی: [ {
    "پروتکل": "آزادی"،
    "تنظیمات": {}
  }]
}
```

لطفا مطمئن شوید که فیلد `id` بین مشتری و سرور یکسان است.

## در حال اجرا {#running}

* در ویندوز و macOS، فایل پیکربندی در دایرکتوری مشابه VineRay باینری قرار دارد. شما ممکن است `v2ray` یا `v2ray.exe` بدون پارامترهای دیگر اجرا کنید.
* در لینوکس، فایل پیکربندی معمولا در `/etc/v2ray/config.json`واقع شده است. اجرا `v2ray --config = / etc / v2ray / config.json` در پیش زمینه و یا از ابزارهای دیگر مانند systemd برای اجرای V2Ray به عنوان فرایند پس زمینه استفاده کنید.

برای جزئیات بیشتر از پیکربندی، [بررسی](../configuration/overview.md) مشاهده کنید.