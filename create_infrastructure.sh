#!/usr/bin/env bash

source env_aws.sh

#printf "Refreshing EC2 cache..."
#./inventory/aws/hosts/ec2.py --refresh-cache
#printf "done\n"

ansible-playbook -v -i inventory/aws/hosts/ec2.py create_infrastructure.yaml
