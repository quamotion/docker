FROM ubuntu:bionic

ARG WEBDRIVER_VERSION

# Install PowerShell
RUN apt-get update \
&& apt-get install -y wget libicu60 libssl1.0.0 \

# Install Powershell Core
&& wget -O powershell.tar.gz https://github.com/PowerShell/PowerShell/releases/download/v6.2.0-rc.1/powershell-6.2.0-rc.1-linux-arm64.tar.gz \
&& mkdir -p /usr/local/powershell \
&& tar zxf powershell.tar.gz -C /usr/local/powershell \
&& ln -s /usr/local/powershell/pwsh /usr/local/bin/pwsh \
&& rm powershell.tar.gz \

## Install PowerShell modules
&& pwsh -command 'Install-Module -Name Quamotion.PowerShell -RequiredVersion $WEBDRIVER_VERSION -Force' \
&& pwsh -command 'Install-Module -Name Pester -Force' \

# Install zip and unzip
&& apt-get install -y zip unzip \

# Delete all the apt list files since they're big and get stale quickly
&& rm -rf /var/lib/apt/lists/*
