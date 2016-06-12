#!/usr/bin/env bash

destdir='/var/www/html'

for image in `docker images | grep -v ^REPOSITORY | '{print $1":"$2}'`
do
    echo ${image}
    docker save ${image} > ${destdir}/${image}.tar
done