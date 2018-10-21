FROM ubuntu:bionic

ARG WEBDRIVER_VERSION
WORKDIR /app

RUN apt-get update \
&& apt-get install -y gnupg \
&& echo "deb http://ppa.launchpad.net/quamotion/ppa/ubuntu xenial main" > /etc/apt/sources.list.d/quamotion.list \
&& apt-key adv --keyserver keyserver.ubuntu.com --recv E25E7A74 \
&& apt-get update \
# For now, install libgdiplus 4.2-2 (from the Ubuntu sources), becaues the libgdiplus version in the Quamotion
# PPA has incorrect dependencies for bionic
&& apt-get install -y libunwind8 libicu60 libc++-dev zlib1g wget libcurl3 libgdiplus=4.2-2 libc6-dev libusb-1.0-0 libusbmuxd-tools libplist-dev libusbmuxd-dev libimobiledevice-dev usbmuxd \

# Delete all the apt list files since they're big and get stale quickly
&& rm -rf /var/lib/apt/lists/*

RUN wget -nv -nc http://cdn.quamotion.mobi/download/quamotion-webdriver.$WEBDRIVER_VERSION.ubuntu.18.04-x64.tar.gz \
&& tar -xvzf quamotion-webdriver.$WEBDRIVER_VERSION.ubuntu.18.04-x64.tar.gz \
&& rm quamotion-webdriver.$WEBDRIVER_VERSION.ubuntu.18.04-x64.tar.gz

RUN mkdir /var/lib/quamotion \
&& mkdir /var/log/quamotion \
&& mkdir /var/run/quamotion

COPY appsettings.json /etc/quamotion/appsettings.json

CMD [ "/app/Quamotion.WebDriver", "--daemon", "--pid", "/var/run/quamotion/Quamotion.WebDriver.pid", "--config", "/etc/quamotion/appsettings.json" ]

EXPOSE 17894
