## Get all files on a folder, listed by line

```
find $folder/ -type f | awk '{gsub("'$folder'/",""); print}'
```