FROM buildpack-deps:xenial-scm

# Install Python
RUN apt-get update \
&& apt-get install -y python3 python3-pip \
&& pip3 install --upgrade pip \
&& pip3 install selenium quamotion \

# Install PowerShell
&& apt-get install -y curl \
&& curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
&& curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | tee /etc/apt/sources.list.d/microsoft.list \
&& apt-get install -y apt-transport-https \
&& apt-get update \
&& apt-get install -y powershell \
&& pwsh -command 'Install-Module -Name Quamotion.PowerShell -RequiredVersion 0.84.115 -Force' \
&& pwsh -command 'Install-Module -Name Pester -Force' \

# Install Maven
&& apt-get install -y maven openjdk-8-jdk-headless \

# Install zip and unzip
&& apt-get install -y zip unzip \

# Delete all the apt list files since they're big and get stale quickly
&& rm -rf /var/lib/apt/lists/*