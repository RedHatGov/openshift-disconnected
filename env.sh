#!/usr/bin/env bash

echo "****************************************"
echo "Are you running bash from ssh-agent?"
echo "Have you loaded your ssh key?"
echo "And don't forget your secrets directory."
echo "See README.md for details."
echo "****************************************"
echo

# Use the correct PYTHONPATH on Mac OS X
if [ "$(uname -s)" == "Darwin" ]; then
    export PYTHONPATH=/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages:/usr/local/lib/python2.7/site-packages
fi

#pushd ansible/lib/ansible/modules/core
#git checkout ca4365b644e3a264dcace54cf3234cd2d5f670b1
#popd
#pushd ansible/lib/ansible/modules/extras
#git checkout b0aec50b9a0434ecf92942dcf2721edc2b60be8c
#popd
#pushd ansible
#git checkout 96495594cc2e6e854ef7e6e0d4a3df5ea688e793
#popd

if [ ! -d secrets ]; then
    mkdir secrets
fi
if [ ! -f secrets/*.pub ]; then
    ssh-keygen -t rsa -N '' -f secrets/deploy
fi

# Read RHN info
printf "RHN username: "
read rhn_username
export rhn_username
printf "RHN password: "
read -s rhn_password
export rhn_password
echo

# Load AWS credentials if they're in ~/.aws, otherwise prompt for them
# TODO make this support more than one keypair in .aws/credentials
if [ -f ~/.aws/credentials ]; then
    export aws_access_key=`grep ^aws_access_key_id ~/.aws/credentials | cut -d' ' -f3`
    export aws_secret_key=`grep ^aws_secret_access_key ~/.aws/credentials | cut -d' ' -f3`
else
    printf "aws_access_key: "
    read aws_access_key
    export aws_access_key
    printf "aws_secret_key: "
    read aws_secret_key
    export aws_secret_key
fi

# Source the local Ansible to get 2.2, which we need for the vpc peering module
#source ./ansible/hacking/env-setup

