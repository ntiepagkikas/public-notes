## Simple wget code to download and organize files

This example script will download an encrypted .rar file, extract it to a folder, search for the biggest file on the folder, move it to another destination, delete the original .rar and the extraction folder.

```
#!/bin/bash

download_url=$1
media_type=$2
media_foldername=$3
media_filename=$4
password=$5

echo "########## DOWNLOADING"
wget "$download_url" -O file.rar

echo "########## EXTRACTING"
unrar x -p$password -o+ file.rar ./folder/

echo "########## CREATING FOLDER"
mkdir -v -p "/mnt/media/$media_type/$media_foldername"

echo "########## MOVING FILE"
find ./folder -type f -exec du -sh {} + | sort -h | tail -n 1 | cut -f2 | xargs -I {} mv -v {} "/mnt/media/$media_type/$media_foldername/$media_filename"

echo "######### CLEANING"
rm -v file.rar
rm -v -rf ./folder
```
