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

Note that this is done for you when you source the env.sh script.

## Usage
To set up your disconnected environment:

```
$ ./sendit.sh
```

If you want to override the default variables in ```group_vars/all.yml```, you can specify your own values when invoking ```ansible-playbook``` in ```sendit.sh```. For example:

```
ansible-playbook -i inventory/aws/hosts/ec2.py --extra-vars "environment=my_env ec2_keypair=my_keypair" site.yml
```
