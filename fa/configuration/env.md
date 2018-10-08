* * *

refcn: chapter_02/env refen: configuration/env

* * *

# Environment Variables

V2Ray reads the following environment variables.

## Cache size per connection {#buffer-size}

* Name: `v2ray.ray.buffer.size` or `V2RAY_RAY_BUFFER_SIZE`
* Unit: MBytes
* Default value: 
  * (V2Ray 3.33-) 10
  * (V2Ray 3.34+) 2 on x86, amd64, arm64 and s390x. This cache is disabled on other platforms.
* Special value: 0 for unlimited cache size

For each connection, when there is a difference in speed between inbound and outbound traffic, V2Ray will cache some data for larger throughput. This setting controls the size of the cache. The larger the cache, the better the performance.

## Location of V2Ray asset {#asset}

* Name: `v2ray.location.asset` or `V2RAY_LOCATION_ASSET`
* Default value: Same directory where v2ray is.

This variable specifies a directory where geoip.dat and geosite.dat files are.

## Location of V2Ray config {#config}

* Name: `v2ray.location.config` or `V2RAY_LOCATION_CONFIG`
* Default value: Same directory where v2ray is.

This variable specifies a directory where config.json is.

## Scatter Reading {#scatter-io}

* Name: `v2ray.buf.readv` or `V2RAY_BUF_READV`
* Default value: `auto`

V2Ray 3.37 uses Scatter/Gather IO. This feature will use less memory when connection speed is over 100 MByte/s. Possible values are: `auto`, `enable` and `disable`.

* `enable`: Enable scatter reading.
* `disable`: Disable scatter reading.
* `auto`: Only enable on Windows, MacOS, Linux when CPU is x86, AMD64 or s390x.

When connection speed is less than 100 MByte/s, no matter whether this is enabled or not, there is no obvious difference in terms of memory usage.