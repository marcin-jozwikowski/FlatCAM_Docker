# FlatCAM Docker
Docker container for running FlatCAM

## Building
```
docker build --build-arg USERNAME=$USER --build-arg USERID=$UID -t flatcam .
```

## Running
```
docker run -ti --rm --network=host \
    --cap-drop=all \
    --privileged \
    --volume=/tmp/.X11-unix:/tmp/.X11-unix \
    --user="$(id --user):$(id --group)" \
    -e DISPLAY=unix$DISPLAY \
    -e XDG_RUNTIME_DIR="$XDG_RUNTIME_DIR" \
    --device=/dev/dri:/dev/dri \
    --volume="$HOME:/home/$USER" \
    --volume=$XDG_RUNTIME_DIR:$XDG_RUNTIME_DIR \
    flatcam
```
