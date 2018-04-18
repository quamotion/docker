# Docker Images for testing Mobile Applications with Quamotion

[![Build Status](https://travis-ci.org/quamotion/docker.svg?branch=master)](https://travis-ci.org/quamotion/docker)

This repository contains the source files for Docker images you can use to [test mobile applications with Quamotion](https://quamotion.mobi).

The main images built from this repository are the [quamotion/webdriver](https://hub.docker.com/r/quamotion/webdriver/)
and [quamotion/ubuntu](https://hub.docker.com/r/quamotion/ubuntu/) images.

The [quamotion/webdriver](https://hub.docker.com/r/quamotion/webdriver/) image contains the Quamotion WebDriver. You can run
the Quamotion WebDriver docker image like this:

```
docker run --privileged --net host -v /dev/bus/usb:/dev/bus/usb -v /var/run/usbmuxd:/var/run/usbmuxd --name quamotion-webdriver quamotion/webdriver
```

The container needs to run with elevated privileges in order to be able to access your iOS and Android devices over USB.
You'll also need to make sure usbmuxd (which manages connections with your iOS devices) is up and running on your host.

The [quamotion/ubuntu](https://hub.docker.com/r/quamotion/ubuntu/) image is preconfigured with the tools you need to
start writing scripts with Quamotion.

## Configuring the Docker Container

You can mount volumes in the Docker container to make sure your settings persist after destroying and re-creating the container.

Within the container, the log files are stored at `/var/log/quamotion` and settings (such as the applications you want to test,
your license key, and the iOS developer disk images) at `/var/lib/quamotion`. 

You can use this command to map these folders to the same path on your host:

```
docker run --privileged --net host -v /dev/bus/usb:/dev/bus/usb -v /var/run/usbmuxd:/var/run/usbmuxd -v /var/log/quamotion:/var/log/quamotion -v /var/lib/quamotion:/var/lib/quamotion --name quamotion-webdriver quamotion/webdriver
```
