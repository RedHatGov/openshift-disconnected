#!/usr/bin/env bash

source env.sh

echo "Refreshing dynamic EC2 inventory. Stand by..."
ansible-playbook -v -i inventory/aws/hosts/ec2.py create_infrastructure.yaml
