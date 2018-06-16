ARG WEBDRIVER_VERSION

FROM quamotion/webdriver:$WEBDRIVER_VERSION

RUN apt-get update \
&& apt-get install -y linux-tools-`uname -r` software-properties-common \
&& curl -OL http://aka.ms/perfcollect \
&& chmod +x perfcollect \
&& ./perfcollect install \
# Delete all the apt list files since they're big and get stale quickly
&& rm -rf /var/lib/apt/lists/*