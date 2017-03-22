# Common error messages

## VMess Authentication failed

### Error messages

* Invalid authentication
* VMessOut: Failed to read VMess response (0 bytes): EOF
* VMessOut: Failed to read VMess response (0 bytes): wsarecv: An existing connection was forcibly closed by the remote host.

### Reason

1. The ID between the client and server doesn't match;
2. The alterId between the client and server doesn't match;
3. The UTC time offset between the server and client is more than 2 minutes;
4. Occasional factors (can be ignored).

## Shadowsocks Authencation failed

### Error messages

Shadowsocks: Unknown address type: xxx

### Reason

1. The encryption method or password of Shadowsocks protocol does not match between the server and client.
