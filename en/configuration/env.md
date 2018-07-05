# Environment Variables

![English](../resources/englishc.svg) [![Chinese](../resources/chinese.svg)](https://www.v2ray.com/chapter_02/env.html)

V2Ray reads the following environment variables.

## Cache size per connection {#buffer-size}

* Name: `v2ray.ray.buffer.size` or `V2RAY_RAY_BUFFER_SIZE`
* Unit: MBytes
* Default value: 10
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
