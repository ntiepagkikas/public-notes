## Get the right bitrate parameter for the wanted bitrate ( example at 1100 )

```
file=

wanted_bitrate=1100

bitrate=$(awk "BEGIN {print int("$wanted_bitrate" * 1024 * 1024 * 8 / $(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$file" ) / 1000)}")k
```