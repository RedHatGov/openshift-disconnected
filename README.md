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

## Usage
To set up your disconnected environment, first source your secrets environment file.

Your secrets file should look something like:

```
#!/bin/bash

export AWS_ACCESS_KEY_ID='abcd...'
export AWS_SECRET_ACCESS_KEY='1234...'
```

Then:

```
$ cd openshift-disconnected
$ ./create_infrastructure.sh
```
