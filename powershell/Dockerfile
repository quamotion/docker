FROM ubuntu:xenial
ENV WEBDRIVER_VERSION 0.91.50

# Install PowerShell
&& apt-get install -y curl \
&& curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
&& curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | tee /etc/apt/sources.list.d/microsoft.list \
&& apt-get install -y apt-transport-https \
&& apt-get update \
&& apt-get install -y powershell \
&& pwsh -command 'Install-Module -Name Quamotion.PowerShell -RequiredVersion $WEBDRIVER_VERSION -Force' \
&& pwsh -command 'Install-Module -Name Pester -Force' \

# Delete all the apt list files since they're big and get stale quickly
&& rm -rf /var/lib/apt/lists/*
