#!/bin/sh
docker build . -t micronaut-hello-native1
echo
echo
echo "To run the docker container execute:"
echo "    $ docker run -p 8080:8080 micronaut-hello-native1"
