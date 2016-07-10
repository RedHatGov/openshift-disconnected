#!/usr/bin/env bash

ansible-playbook -i inventory/aws/hosts/ec2.py site.yml
