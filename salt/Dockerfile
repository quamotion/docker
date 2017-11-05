FROM buildpack-deps:xenial-scm

# Install Python
RUN apt-get update
RUN apt-get install -y python3 python3-pip
RUN pip3 install selenium quamotion

# Install PowerShell
RUN apt-get install -y curl
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | tee /etc/apt/sources.list.d/microsoft.list
RUN apt-get install -y apt-transport-https
RUN apt-get update
RUN apt-get install -y powershell
RUN powershell -command 'Install-Module -Name Quamotion.PowerShell -RequiredVersion 0.70.4  -Force'

# Install the Salt minion
RUN wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | apt-key add -
RUN echo deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main | tee /etc/apt/sources.list.d/saltstack.list
RUN apt-get update
RUN apt-get install -y salt-minion
VOLUME [ "/etc/salt" ]

# Delete all the apt list files since they're big and get stale quickly
RUN rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "/bin/bash" ]
