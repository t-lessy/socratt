# Socratt - easiest (single sh and env vars) LAN forwarding for one, who has poor router.
## How it works?
 - You give it starting and ending port, local ip as destination and start it!

## Why? & Why Docker image, as it can be used as shell script?
 - I love Docker Compose and it's simplicity for anyone's home-lab. I also have some local machines and Pelican panel, but don't want to use advanced iptables' rules for forwarding ports. If you familiar with Pelican (not sure about Pterodactyl), you know it have no port forwarding, and relies on your own networking skills. It seems like no problem with one host-machine, but if you have several hosts (Wings) then it opening ports only on machine running server, but not a one with WAN domain. It does NOT link a server with main domain, but requires you to have a reverse proxy, local network with ready forwarding, or router-device with multi-ip-per-domain (not subdomains) capability. I assumed it would be easier to have ready compose.yml for others, who need to set up forwarding fast and concrete.

## Who would need it?
 - Selfhosters with simplicity-need for their homelabs.
 - Pelican early-users, who have several hosts.
 - Users who loves Docker Compose, but hates Docker CLI. It works on both.

## Why "Socratt"?
 Because it uses socat. Soc+rat+t. Do not mind about last T like t-lessy. >:(

##Example Compose file:
```yaml
services:
  socratt:
    image: git.tlessy.ru/t-lessy/socratt
    container_name: socratt
	# cap_add: [NET_BIND_SERVICE] ### USE IT only WITH PRIVILEGED PORTS (below 1025)
    network_mode: host # It will not use already opened ports, but can open it earlier than host. Use it carefully.
    restart: unless-stopped
    environment:
      START_PORT: 16000
      END_PORT: 16799
      TARGET_IP: 192.168.100.15
```
