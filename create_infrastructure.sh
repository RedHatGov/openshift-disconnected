#!/usr/bin/env bash

source env_aws.sh

read -p "RHN Username: " username
read -s -p "RHN Password: " password
export rhn_username="${username}"
export rhn_password="${password}"
echo

ansible-playbook -v -i inventory/aws/hosts/ec2.py create_infrastructure.yaml
