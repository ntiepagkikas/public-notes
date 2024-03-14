## Simple wget code to download and organize files

This example script will download an encrypted .rar file, if the .rar is bigger than 50mb, extract it to a folder, search for the biggest file on the folder, remove any metadata using ffmpeg, move the clean mkv to another destination, delete the original .rar and the extraction folder. If the file downloaded results to be lower than 50mb will delete the file. ( avoids to run unwanted commands on http errors )

I'm using mkv but you can edit to the expected extension. If only set the final extension on the ffmpeg command, will transcode the file so set proper rules for transcoding if necessary.

```
#!/bin/bash

download_url=$1
media_type=$2
media_foldername=$3
media_filename=$4
password=$5

echo "########## DOWNLOADING"
wget "$download_url" -O file.rar

file_size=$(stat -c %s file.rar)

if [ $file_size -gt 50000000 ]; then
        echo "########## EXTRACTING"
        unrar x -p$password -o+ file.rar ./folder/

        echo "########## CREATING FOLDER"
        mkdir -v -p "/mnt/media/$media_type/$media_foldername"

        echo "########## REMOVING METADATA"
        find ./folder -type f -exec du -sh {} + | sort -h | tail -n 1 | cut -f2 | xargs -I {} ffmpeg -i {} -y -map_metadata -1 -c copy "file.mkv"

        echo "########## MOVING FILE"
        mv -v file.mkv "/mnt/media/$media_type/$media_foldername/$media_filename.mkv"

        rm -v -rf ./folder
        rm -v -rf file.mkv
fi

echo "######## CLEANING"
rm -v file.rar

echo "######## FINISHED"
```
