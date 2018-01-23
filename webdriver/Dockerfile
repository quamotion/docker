FROM ubuntu:xenial

WORKDIR /app

RUN apt-get update \
&& apt-get install -y libunwind8 libicu55 libc++-dev zlib1g wget libcurl3 libgdiplus libc6-dev \

# Delete all the apt list files since they're big and get stale quickly
&& rm -rf /var/lib/apt/lists/*

RUN wget -nv -nc http://cdn.quamotion.mobi/download/quamotion-webdriver.0.83.11-gc436e14589.ubuntu.16.04-x64.tar.gz \
&& tar -xvzf quamotion-webdriver.0.83.11-gc436e14589.ubuntu.16.04-x64.tar.gz \
&& rm quamotion-webdriver.0.83.11-gc436e14589.ubuntu.16.04-x64.tar.gz

RUN mkdir /var/lib/quamotion \
&& mkdir /var/log/quamotion \
&& mkdir /var/run/quamotion

COPY appsettings.json /etc/quamotion/appsettings.json

CMD [ "/app/Quamotion.WebDriver", "--daemon", "--pid", "/var/run/quamotion/Quamotion.WebDriver.pid", "--config", "/etc/quamotion/appsettings.json" ]

EXPOSE 17894
