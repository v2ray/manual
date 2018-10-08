* * *

refcn: chapter_02/stats refen: configuration/stats

* * *

# Statistics

V2Ray provides some information about its internals.

Configuration:

```javascript
{
}
```

All stats counters are listed below:

* `user>>>[email]>>>traffic>>>uplink` (V2Ray 3.16+): Accumulated uplink traffic of specific user, in bytes.
* `user>>>[email]>>>traffic>>>downlink` (V2Ray 3.16+): Accumulated downlink traffic of specific user, in bytes.
* `inbound>>>[tag]>>>traffic>>>uplink` (V2Ray 3.18+): Accumulated uplink traffic of specific inbound, in bytes.
* `inbound>>>[tag]>>>traffic>>>downlink` (V2Ray 3.18+): Accumulated downlink traffic of specific inbound, in bytes.

## Tips

* If a user doesn't have a valid email address, the stats will not be enabled.