FROM ubuntu:bionic

ARG WEBDRIVER_VERSION
ARG ARCH=x64

WORKDIR /app

RUN apt-get update \
&& apt-get install -y gnupg wget ca-certificates \
&& echo "deb http://ppa.launchpad.net/quamotion/ppa/ubuntu bionic main" > /etc/apt/sources.list.d/quamotion.list \
&& apt-key adv --keyserver keyserver.ubuntu.com --recv E25E7A74 \
&& echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" > /etc/apt/sources.list.d/mono-official-stable.list \
&& apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF \
&& apt-get update \
#
# Install Quamotion WebDriver
#
&& apt-get install -y libimobiledevice6 libusbmuxd-tools libgdiplus libturbojpeg usbmuxd libgssapi-krb5-2 libicu60 sudo \
&& wget -O quamotion-webdriver.deb -nv -nc http://cdn.quamotion.mobi/download/quamotion-webdriver.$WEBDRIVER_VERSION.linux-$ARCH.deb \
#
# The Debian package comes with postint scripts which require sudo, systemctl to be present. Skip these scripts for now.
#
&& dpkg --unpack quamotion-webdriver.deb \
&& rm /var/lib/dpkg/info/quamotion-webdriver.postinst -f \
&& dpkg --configure quamotion-webdriver \
&& rm quamotion-webdriver.deb \
#
# Delete all the apt list files since they're big and get stale quickly
#
&& rm -rf /var/lib/apt/lists/*

COPY appsettings.json /etc/quamotion/appsettings.json

CMD [ "/usr/share/quamotion/Quamotion.WebDriver", "--daemon", "--pid", "/var/run/quamotion/Quamotion.WebDriver.pid", "--config", "/etc/quamotion/appsettings.json" ]

EXPOSE 17894
