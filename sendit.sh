#!/usr/bin/env bash

#export ANSIBLE_CONFIG=./ansible.cfg
#ansible-playbook -i inventory/aws/hosts/ec2.py site.yml && \
## The following two lines are a workaround to ec2 dynamic inventory problems
## until I figure out a more elegant solution.
#python inventory/aws/hosts/ec2.py --refresh-cache && \
#ansible-playbook -i inventory/aws/hosts/ec2.py site.yml --skip-tags=private_aws && \
# At this point our bastion host should be up, so we'll proceed with
# the private hosts via the bastion.
#export ANSIBLE_CONFIG=./ansible_bastion.cfg && \
#ansible-playbook -i inventory/static/hosts static.yml

export ANSIBLE_CONFIG=./ansible.cfg
ansible-playbook -i inventory/aws/hosts/ec2.py site.yml --tags=private_aws && \
export ANSIBLE_CONFIG=./ansible_bastion.cfg && \
ansible-playbook -i inventory/static/hosts static.yml
