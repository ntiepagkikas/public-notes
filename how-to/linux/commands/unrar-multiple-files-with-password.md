## Unrar password-protected files in bulk

```
#!/bin/bash
password=
cd folder
for file in $(find -name '*.rar')
do
  unrar x -p$password -o+ "$file"
done
```
