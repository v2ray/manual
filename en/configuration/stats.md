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

At the moment there is no parameter in stats settings. Stats is enabled automatically when the `StatsObject` is set in top level configuration. You need also enable the corresponding settings in [Policy](policy.md), in order to keep track of user or system stats.

All stats counters are listed below:

## User Traffic

If an user doesn't has email address set in protocol settings, the traffic stats will not be enabled.

> `user>>>[email]>>>traffic>>>uplink`

Accumulated uplink traffic of specific user, in bytes.

> `user>>>[email]>>>traffic>>>downlink`

Accumulated downlink traffic of specific user, in bytes.

## Global Traffic

> `inbound>>>[tag]>>>traffic>>>uplink`

Accumulated uplink traffic of specific inbound, in bytes.

> `inbound>>>[tag]>>>traffic>>>downlink`

Accumulated downlink traffic of specific inbound, in bytes.
