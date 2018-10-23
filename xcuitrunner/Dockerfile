FROM ubuntu:xenial

ARG WEBDRIVER_VERSION
WORKDIR /app

RUN apt-get update \
&& apt-get install -y libunwind8 libicu55 libc++-dev zlib1g wget libcurl3 libc6-dev \

# Delete all the apt list files since they're big and get stale quickly
&& rm -rf /var/lib/apt/lists/*

RUN wget -nv -nc http://cdn.quamotion.mobi/download/xcuitrunner.$WEBDRIVER_VERSION.ubuntu.16.04-x64.tar.gz \
&& tar -xvzf xcuitrunner.$WEBDRIVER_VERSION.ubuntu.16.04-x64.tar.gz \
&& rm xcuitrunner.$WEBDRIVER_VERSION.ubuntu.16.04-x64.tar.gz

CMD [ "/app/xcuitrunner", "--help" ]

EXPOSE 8100
