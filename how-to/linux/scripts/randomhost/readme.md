# LINUX - Set random hostname on boot

Using systemctl to set a random hostname at boot time.

- Copy randomhost.sh to /usr/bin/randomhost

```
cp randomhost.sh /usr/bin/randomhost
chmod +x /usr/bin/randomhost
```

- Copy randomhost.service to /etc/systemd/system/randomhost.service

```
cp randomhost.service /etc/systemd/system/randomhost.service
systemctl reload
systemctl enable randomhost
systemctl start randomhost
```