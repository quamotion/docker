ARG WEBDRIVER_VERSION

FROM quamotion/webdriver:$WEBDRIVER_VERSION

RUN apt-get update \
&& apt-get install -y linux-tools-`uname -r` software-properties-common curl zip unzip \
&& apt-add-repository -y ppa:lttng/stable-2.10 \
&& apt-get update \
&& apt-get install -y lttng-tools lttng-modules-dkms liblttng-ust-dev \
&& curl -OL http://aka.ms/perfcollect \
&& chmod +x perfcollect \
# Delete all the apt list files since they're big and get stale quickly
&& rm -rf /var/lib/apt/lists/*