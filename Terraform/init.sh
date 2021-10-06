#!/bin/bash

# Script to set up basics for repository
# It will set up some configuration locally and download the latest
# Flatcar image

if [ ! -f "secrets.auto.tfvars.json" ]
then
    cp secrets.auto.tfvars.json.example secrets.auto.tfvars.json
fi

if [ ! -f "id_rsa" ]
then
    ssh-keygen -b 4096 -t rsa -f ./id_rsa -q -N ""
fi

if [ ! -f "flatcar_production_openstack_image.img" ]
then
    wget https://stable.release.flatcar-linux.net/amd64-usr/current/flatcar_production_openstack_image.img.bz2
    bunzip2 flatcar_production_openstack_image.img.bz2
fi