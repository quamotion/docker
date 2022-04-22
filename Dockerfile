FROM public.ecr.aws/lts/ubuntu:focal

ARG WEBDRIVER_VERSION=2.10.3
ARG ARCH=x64
LABEL maintainer "Frederik Carlier <frederik.carlier@keysight.com>"

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

RUN apt-get update \
&& apt-get install -y gnupg wget ca-certificates \
#
# Install xcuitrunner
&& architecture=$(uname -m) \
&& case "$architecture" in \
    x86_64) \
        architecture=x64 \
        ;; \
    aarch64) \
        architecture=arm64 \
        ;; \
esac \
&& apt-get install -y libimobiledevice6 libusbmuxd-tools libturbojpeg libgssapi-krb5-2 libicu66 \
&& wget -O xcuitrunner.deb -nv -nc http://cdn.quamotion.mobi/download/xcuitrunner.$WEBDRIVER_VERSION.linux-$architecture.deb \
&& dpkg -i xcuitrunner.deb \
&& rm xcuitrunner.deb \
#
# Delete all the apt list files since they're big and get stale quickly
#
&& rm -rf /var/lib/apt/lists/*

CMD [ "/app/xcuitrunner", "--help" ]

EXPOSE 8100
