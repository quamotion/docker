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
&& pwsh -command 'Install-Module -Name Quamotion.PowerShell -RequiredVersion 0.79.0  -Force' \

# Install Maven
&& apt-get install -y maven openjdk-8-jdk-headless \

# Install OpenSSH
&& apt-get install -y openssh-server \
&& mkdir /var/run/sshd \
&& echo 'root:screencast' | chpasswd \
&& sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \

# SSH login fix. Otherwise user is kicked off after login
&& sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd \

# Install zip and unzip
&& apt-get install -y zip unzip \

# Delete all the apt list files since they're big and get stale quickly
&& rm -rf /var/lib/apt/lists/*

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
