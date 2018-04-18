FROM ubuntu:xenial

WORKDIR /app
ENV WEBDRIVER_VERSION 0.88.4

RUN echo "deb http://ppa.launchpad.net/quamotion/ppa/ubuntu xenial main" > /etc/apt/sources.list.d/quamotion.list \
&& apt-key adv --keyserver keyserver.ubuntu.com --recv E25E7A74 \
&& apt-get update \
&& apt-get install -y libunwind8 libicu55 libc++-dev zlib1g wget libcurl3 libgdiplus libc6-dev libusb-1.0-0 \

# Delete all the apt list files since they're big and get stale quickly
&& rm -rf /var/lib/apt/lists/*

RUN wget -nv -nc http://cdn.quamotion.mobi/download/quamotion-webdriver.$WEBDRIVER_VERSION.ubuntu.16.04-x64.tar.gz \
&& tar -xvzf quamotion-webdriver.$WEBDRIVER_VERSION.ubuntu.16.04-x64.tar.gz \
&& rm quamotion-webdriver.$WEBDRIVER_VERSION.ubuntu.16.04-x64.tar.gz

RUN mkdir /var/lib/quamotion \
&& mkdir /var/log/quamotion \
&& mkdir /var/run/quamotion

COPY appsettings.json /etc/quamotion/appsettings.json

CMD [ "/app/Quamotion.WebDriver", "--daemon", "--pid", "/var/run/quamotion/Quamotion.WebDriver.pid", "--config", "/etc/quamotion/appsettings.json" ]

EXPOSE 17894
