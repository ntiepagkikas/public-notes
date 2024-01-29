# Mirror a website with wget, HTTrack style

```
wget --mirror --recursive -erobots=off --page-requisites --html-extension --span-hosts $1
```