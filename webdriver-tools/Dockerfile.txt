ARG WEBDRIVER_VERSION

FROM quamotion/webdriver:$WEBDRIVER_VERSION

RUN apt-get update \
&& apt-get install -y linux-tools-`uname -r` \
&& apt-add-repository -y ppa:lttng/stable-2.10 \
&& apt-get update \
&& apt-get install -y lttng-tools lttng-modules-dkms liblttng-ust-dev \
# Delete all the apt list files since they're big and get stale quickly
&& rm -rf /var/lib/apt/lists/*