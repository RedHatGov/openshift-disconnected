#!/usr/bin/env bash

ansible-playbook -i inventory/aws/hosts/ec2.py site.yml
# The following two lines are a workaround to ec2 dynamic inventory problems
# until I figure out a more elegant solution.
python inventory/aws/hosts/ec2.py --refresh-cache
ansible-playbook -i inventory/aws/hosts/ec2.py site.yml --skip-tags=private_aws
