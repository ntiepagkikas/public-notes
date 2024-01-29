# UFW - Only Allow Cloudflare IPs

Use UFW to block any IP except Cloudflare known ips to your host.

```
#!/bin/sh

for cfip in `curl -sw '\n' https://www.cloudflare.com/ips-v{4,6}` do 
  ufw allow proto tcp from $cfip to any port 80,443 comment 'Cloudflare IP'
done

ufw reload > /dev/null
```