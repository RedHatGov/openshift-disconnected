#!/usr/bin/env bash

export ANSIBLE_CONFIG=./ansible.cfg
ansible-playbook -i "localhost" localhost.yml && \
ansible-playbook -i inventory/aws/hosts/ec2.py site.yml && \
# After we're done with the dynamic part, we switch to the static
# hosts file and the Ansible config which tunnels through the bastion
# host.
export ANSIBLE_CONFIG=./ansible_bastion.cfg && \
ansible-playbook -i inventory/static/hosts static.yml

