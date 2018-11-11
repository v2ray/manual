---
refcn: chapter_02/env
refen: configuration/env
---
# متغیرهای محیطی

V2Ray متغیرهای محیط زیر را می خواند.

## اندازه کش در هر اتصال {#buffer-size}

* نام: `v2ray.ray.buffer.size` یا `V2RAY_RAY_BUFFER_SIZE`
* واحد: MBytes
* مقدار پیش فرض: 2 در x86، amd64، arm64 و s390x. این حافظه پنهان در سایر سیستم عاملها غیرفعال است.
* مقدار ویژه: 0 برای اندازه حافظه پنهان نامحدود

**Deprecated. Use bufferSize in Policy.**

For each connection, when there is a difference in speed between inbound and outbound traffic, V2Ray will cache some data for larger throughput. This setting controls the size of the cache. The larger the cache, the better the performance.

## محل دارایی V2Ray {#asset}

* نام: `v2ray.location.asset` یا `V2RAY_LOCATION_ASSET`
* مقدار پیش فرض: همان پوشه ای است که v2ray است.

This variable specifies a directory where geoip.dat and geosite.dat files are.

## محل پیکربندی V2Ray {#config}

* نام: `v2ray.location.config` یا `V2RAY_LOCATION_CONFIG`
* مقدار پیش فرض: همان پوشه ای است که v2ray است.

This variable specifies a directory where config.json is.

## پراکندگی خواندن {#scatter-io}

* نام: `v2ray.buf.readv` یا `V2RAY_BUF_READV`
* مقدار پیش فرض: `خودکار`

V2Ray 3.37 uses Scatter/Gather IO. This feature will use less memory when connection speed is over 100 MByte/s. Possible values are: `auto`, `enable` and `disable`.

* `فعال کردن`: فعال کردن خواندن پراکنده
* `غیر فعال کردن`: غیر فعال کردن خواندن پراکنده.
* `خودکار`: در ویندوز، MacOS، لینوکس فعال می شود، زمانی که پردازنده x86، AMD64 یا s390x است.

When connection speed is less than 100 MByte/s, no matter whether this is enabled or not, there is no obvious difference in terms of memory usage.