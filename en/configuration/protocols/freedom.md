# Freedom

Freedom is a protocol for outbound connections. It passes all TCP or UDP connection to their destinations.

* Name: freedom
* Type: Outbound
* Configuration:

```javascript
{
  "domainStrategy": "AsIs",
  "timeout": 0,
  "redirect": "127.0.0.1:3366",
  "userLevel": 0
}
```

Where:

* `domainStrategy`: Strategy for domain name resolution. Options are:
  * `"AsIs"`: Default. Resolve domain name by system.
  * `"UseIP"`: Use [internal DNS](../04_dns.md) for domain name resolution.
* `timeout` (Deprecated, equivalent to `connIdle` in Policy): Timeout for idle connection in seconds. Default value 300.
* `redirect`: Redirect all connections to this address, in form like `"127.0.0.1:80"` or `":1234"`.
* `userLevel`: User level. All connections share this level.
