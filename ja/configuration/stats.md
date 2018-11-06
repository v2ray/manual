---
refcn: chapter_02/stats
refen: configuration/stats
---
# Statistics

V2Ray provides some information about its internals.

## StatsObject

`StatsObject` is used as `stats` field in top level configuration.

```javascript
{
}
```

All stats counters are listed below:

> `user>>>[email]>>>traffic>>>uplink`

Accumulated uplink traffic of specific user, in bytes.

> `user>>>[email]>>>traffic>>>downlink`

Accumulated downlink traffic of specific user, in bytes.

> `inbound>>>[tag]>>>traffic>>>uplink`

Accumulated uplink traffic of specific inbound, in bytes.

> `inbound>>>[tag]>>>traffic>>>downlink`

Accumulated downlink traffic of specific inbound, in bytes.

## Tips

* If a user doesn't have a valid email address, the stats will not be enabled.