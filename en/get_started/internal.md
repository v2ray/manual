# Principle

You may want to learn the principle of V2Ray before config it, the diagram below is how a single V2Ray process works. Multiple V2Ray can work independently.
![](../resources/internal.svg)

* Needs at least one Inbound and one Outbound to make it work. [List of protocols](../chapter_02/02_protocols.md)
  * Inbound is for communicate with clients, such as browser.
    * User authentication such as User ID and password can be configured in the Inbound;
  * Dispatcher will distribute the data after Inbound recevied it.
  * Outbound is for distribute data to a server, such as V2Ray on another machine.
* When multiple Outbound exists, Routing can be used to determine which Outbound responsible for a certain type of traffics.
  * Routing will query DNS for more information when necessary to be a factor of the determination.

Specific config formats can be found in [Section 2](chapter_02/01_overview.md).
