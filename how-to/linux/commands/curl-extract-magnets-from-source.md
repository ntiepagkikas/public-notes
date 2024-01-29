# CURL - Get all magnets from an url

Extract all magnet links from a given URL

```
curl -s $url | grep -o 'magnet:[^"]*'
```