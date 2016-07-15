#!/usr/bin/env bash

# Use the correct PYTHONPATH on Mac OS X
if [ "$(uname -s)" == "Darwin" ]; then
    export PYTHONPATH=/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages:/usr/local/lib/python2.7/site-packages
fi

# Source the local Ansible to get 2.2, which we need for the vpc peering module
source ./ansible/hacking/env-setup

