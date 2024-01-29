## Use npm tools srt-to-vtt and ass-to-vtt to format all subs in a folder to the .vtt format

```
find . -name '*.srt' -execdir sh -c 'srt-to-vtt "$1" > "${1%.srt}.vtt"' sh {} \;
find . -name '*.ass' -execdir sh -c 'ass-to-vtt "$1" > "${1%.ass}.vtt"' sh {} \;
```