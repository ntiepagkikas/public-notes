## Check if host has nvidia card, if so, set encoder to h264_nvenc, if not set it to libx264

```
gpu=$(lspci | grep -i '.* vga .* nvidia .*')

if [[ $gpu == *' NVIDIA '* ]]; then
  encoder="h264_nvenc"
else
  encoder="libx264"
fi
```