FROM gitlab/gitlab-runner:ubuntu-v10.1.0

# Install Python
RUN apt-get update \
&& apt-get install -y python3 python3-pip \
&& pip3 --version \
&& pip3 install --upgrade pip \
&& pip3 install --upgrade setuptools \

# See https://cryptography.io/en/latest/installation/
&& apt-get install -y build-essential libssl-dev libffi-dev python3-dev \
&& pip3 install selenium quamotion adal \

# Install PowerShell
&& curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
&& curl https://packages.microsoft.com/config/ubuntu/14.04/prod.list | tee /etc/apt/sources.list.d/microsoft.list \
&& apt-get install -y apt-transport-https \
&& apt-get update \
&& apt-get install -y powershell \
&& pwsh -command 'Install-Module -Name Quamotion.PowerShell -RequiredVersion 0.78  -Force' \

# Utilities we use
&& apt-get install unzip \

# Delete all the apt list files since they're big and get stale quickly
&& rm -rf /var/lib/apt/lists/*
