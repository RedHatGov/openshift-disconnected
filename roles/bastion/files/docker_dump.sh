#!/usr/bin/env bash

for image in `docker images | grep -v ^REPOSITORY | '{print $1":"$2}'`
do
    echo ${image}
    docker save ${image} > ${image}.tar
done