# Musiccodes main server

## Docker

Build - no audio support.

```
docker build . -t muziccodes
```

Run in background:
```
docker run -d --restart=always -p 3000:3000 --name=muziccodes muziccodes
```

foreground test:
```
docker run -it --rm -p 3000:3000 --name=muziccodes muziccodes:latest
```

## Notes

OSC depends on serialport, which (possibly amongst other packages)
won't work with Alpine after building with Debian.


