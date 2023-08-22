Use for RK3588 NPU Production environment

```
docker run -itd --restart=always --privileged kap0ng/rk3588_dev
```

!!! When starting the container, please use the -v parameter to map the corresponding files in the host to the container.
The reference parameters of run container are as follows:
    -v /dev/dri/renderD129:/dev/dri/renderD129
    -v /proc/device-tree/compatible:/proc/device-tree/compatible
