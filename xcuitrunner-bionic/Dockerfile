FROM ubuntu:bionic

ARG WEBDRIVER_VERSION
WORKDIR /app
RUN apt-get update \
&& apt-get install -y gnupg \
&& echo "deb http://ppa.launchpad.net/quamotion/ppa/ubuntu xenial main" > /etc/apt/sources.list.d/quamotion.list \
&& apt-key adv --keyserver keyserver.ubuntu.com --recv E25E7A74 \
&& apt-get update \
&& apt-get install -y libunwind8 libicu60 libc++-dev zlib1g wget libcurl3 libc6-dev libusbmuxd-tools libplist-dev libusbmuxd-dev libimobiledevice-dev \

# Delete all the apt list files since they're big and get stale quickly
&& rm -rf /var/lib/apt/lists/*

RUN wget -nv -nc http://cdn.quamotion.mobi/download/xcuitrunner.$WEBDRIVER_VERSION.ubuntu.18.04-x64.tar.gz \
&& tar -xvzf xcuitrunner.$WEBDRIVER_VERSION.ubuntu.18.04-x64.tar.gz \
&& rm xcuitrunner.$WEBDRIVER_VERSION.ubuntu.18.04-x64.tar.gz

CMD [ "/app/xcuitrunner", "--help" ]

EXPOSE 8100
