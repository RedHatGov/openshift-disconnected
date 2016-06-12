# openshift-disconnected
Ansible playbooks for creating disconnected OpenShift environments

## AWS only for now
While we're figuring this out, we're going to focus on:

1. Make it work
2. Make it right (best practices)
3. Make it fast
4. Cross-platform (OpenStack, etc.)

## Ansible version
This requires Ansible 2.2. Instructions for installation from source are at: http://docs.ansible.com/ansible/intro_installation.html#running-from-source

When running on my Mac, I had to set the PYTHONPATH before sourcing hacking/env-setup:

```
$ export PYTHONPATH=/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages:/usr/local/lib/python2.7/site-packages
```

Note that this is done for you by the create_infrastructure.sh script.

## Usage
To set up your disconnected environment, first source your secrets environment file.

Your secrets file should look something like:

```
#!/bin/bash

export AWS_ACCESS_KEY_ID='abcd...'
export AWS_SECRET_ACCESS_KEY='1234...'
export ec2_keypair="keypair_name"
```

For example:

```
$ cd openshift-disconnected
$ source ../path/to/my/secrets.sh
$ ./create_infrastructure.sh
```

## Pitfalls
Right now we have duplicative variables in env_aws.sh and in the role vars. They need to match. 