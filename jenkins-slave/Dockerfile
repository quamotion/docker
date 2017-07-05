FROM jenkinsci/jnlp-slave

USER root

# Install Python
RUN apt-get update
RUN apt-get install -y python3 python3-pip
RUN pip3 install selenium quamotion

# Install PowerShell
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/14.04/prod.list | tee /etc/apt/sources.list.d/microsoft.list
RUN apt-get install -y apt-transport-https
RUN apt-get update
RUN apt-get install -y powershell
RUN powershell -command 'Install-Module -Name Quamotion.PowerShell -RequiredVersion 0.70.4  -Force'

# Delete all the apt list files since they're big and get stale quickly
RUN rm -rf /var/lib/apt/lists/*

USER jenkins
