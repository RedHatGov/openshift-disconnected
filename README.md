# openshift-disconnected
Ansible playbooks for creating disconnected OpenShift environments

## AWS only for now
While we're figuring this out, we're going to focus on:

1. Make it work
2. Make it right (best practices)
3. Make it fast
4. Cross-platform (OpenStack, etc.)

## Usage
To set up your disconnected environment, first source your secrets environment file.

Then:

```
$ cd openshift-disconnected
$ source env_aws.sh
$ ./create_infrastructure.sh
```
