## Encode File to MP4

This script uses the FFMPEG docker image found on my public-notes.

The script will match the language ( Spanish on the Example ) on the Audio channel to produce a .mp4 with only 1 audio stream.

If no audio stream is found, will include all of them on the final .mp4

All metadata will be removed on the process to clean the file.

Subtitles will not be included.

<br />
<br />
<br />

```
#!/bin/bash

cd watch

for file in *; do
  echo "Encoding $file"
  #docker-compose run --rm ffmpeg -y -hide_banner -v warning -stats -i "/mnt/media_watch/$file" "/mnt/media_output/$file.mp4"
  if (( $(ffmpeg -i "$file" -c copy -map 0:a:m:language:spa -f null - -v 0 -hide_banner && echo -e $? || echo -e $?) == 0 ))
  then
    echo "FOUND: Spanish"
    docker-compose run --rm ffmpeg -y -hide_banner -v warning -stats -i "/mnt/media_watch/$file" -map_metadata -1 -c:v libx264 -crf 23 -pix_fmt yuv420p -map 0:v -map 0:a:m:language:spa  "/mnt/media_output/$file.spa.mp4"
  else
    echo "NOT_FOUND: Default"
    docker-compose run --rm ffmpeg -y -hide_banner -v warning -stats -i "/mnt/media_watch/$file" -map_metadata -1 -c:v libx264 -crf 23 -pix_fmt yuv420p -map 0:v -map 0:a  "/mnt/media_output/$file.unk.mp4"
  fi
  echo ""
  echo ""
done

cd ../
```
