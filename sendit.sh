#!/usr/bin/env bash

ansible-playbook -v -i inventory/aws/hosts/ec2.py site.yml
