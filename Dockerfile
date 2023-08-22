FROM python:3.10

WORKDIR /workspace

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt install -y libopencv-dev python3-opencv ffmpeg && \
    rm -rf /var/lib/apt/lists/*

ADD https://github.com/rockchip-linux/rknpu2/raw/master/runtime/RK3588/Linux/librknn_api/aarch64/librknn_api.so /usr/lib/
ADD https://github.com/rockchip-linux/rknpu2/raw/master/runtime/RK3588/Linux/librknn_api/aarch64/librknnrt.so /usr/lib/
ADD requirement.txt /

RUN ldconfig && pip install --no-cache-dir -r /requirement.txt

EXPOSE 80
EXPOSE 6006

ENV JUPYTER_PORT=80
ENV JUPYTER_HOST=0.0.0.0
ENV SHELL=/bin/bash

CMD ["jupyter","lab","--allow-root","--ip","0.0.0.0"]
