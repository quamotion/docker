# Docker Images for testing Mobile Applications with Quamotion

[![Build Status](https://travis-ci.org/quamotion/docker.svg?branch=master)](https://travis-ci.org/quamotion/docker)

This repository contains the source files for Docker images you can use to [test mobile applications with Quamotion](https://quamotion.mobi).

The main images built from this repository are the [quamotion/webdriver](https://hub.docker.com/r/quamotion/webdriver/)
and [quamotion/ubuntu](https://hub.docker.com/r/quamotion/ubuntu/) images.

The [quamotion/webdriver](https://hub.docker.com/r/quamotion/webdriver/) image contains the Quamotion WebDriver. You can run
the Quamotion WebDriver docker image like this:

```
docker run --privileged --net host -v /dev/bus/usb:/dev/bus/usb --name quamotion-webdriver quamotion/webdriver
```

The [quamotion/ubuntu](https://hub.docker.com/r/quamotion/ubuntu/) image is preconfigured with the tools you need to
start writing scripts with Quamotion.
