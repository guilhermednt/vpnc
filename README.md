# vpnc
Cisco vpn client

## Environment Variables

- `VPNC_GATEWAY`: IP/name of your IPSec gateway
- `VPNC_ID`: Group name
- `VPNC_SECRET`: Group password
- `VPNC_USERNAME`: XAUTH username
- `VPNC_PASSWORD`: XAUTH password

## Running VPN

```
$ docker network create --subnet=172.20.0.0/16 fortinet
$ docker build -t gdnt/fortinet-vpn-client .
```

```
$ docker run --privileged --net fortinet --ip 172.20.0.2 -t -i -e "VPNC_GATEWAY=vpn_address" -e "VPNC_ID=group" -e "VPNC_SECRET=group_secret" -e "VPNC_USERNAME=username" -e "VPNC_PASSWORD=password" gdnt/fortinet-vpn-client
```
