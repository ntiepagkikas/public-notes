## Generate a .torrent for every .mp4 file on a folder with a sharing link to a web server ( http download example )

```
SHARE_URL="https://your-http-host-here"
find . -type f -name '*.mp4' -exec sh -c 'create-torrent "{}" --name $(basename "{}") --urlList '$SHARE_URL'"{}" --outfile "{}".torrent' \;
```