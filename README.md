# openshift-disconnected
Ansible playbooks for creating disconnected OpenShift environments

## Yeah, what?
My team has to do a lot with air-gapped networks. By 'air-gapped' we mean, networks that don't have Internet connectivity. So think about trying to install something complicated like OpenShift without access to:

* Yum repos
* Docker registries
* GitHub
* ...or anything else you're used to having access to on the Internet

## AWS only for now
While we're figuring this out, we're going to focus on:

1. Make it work
2. Make it right (best practices)
3. Make it fast
4. Cross-platform (OpenStack, etc.)

So until it works, is right, and runs reasonably fast, we'll be focusing on AWS. But the next stop is OpenStack.

## Ansible version
This requires Ansible 2.2. Instructions for installation from source are at: http://docs.ansible.com/ansible/intro_installation.html#running-from-source

When running on my Mac, I had to set the PYTHONPATH before sourcing hacking/env-setup:

```
$ export PYTHONPATH=/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages:/usr/local/lib/python2.7/site-packages
```

Note that this is done for you when you source the env.sh script.

## Usage
To set up your disconnected environment, first be sure that you can first ```aws ec2 describe-instances```. If your AWS CLI isn't configured, follow this [install guide](http://docs.aws.amazon.com/cli/latest/userguide/installing.html#install-with-pip), then [configure it](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html).

You'll also need to install the ```boto``` and ```boto3``` Python modules. 

If you're using an rpm-based Linux distro, you can do this with ```# yum install -y python-boto python-boto3```.
 
If you're using a Mac, you can ```pip install boto; pip install boto3```, or use [Homebrew](http://brew.sh/).

Once your AWS CLI is set up, follow these steps:

```
$ git clone --recursive https://github.com/jason-callaway/openshift-disconnected
$ cd openshift-disconnected
$ source env.sh # input your RHN username and password
$ ./sendit.sh
```

## Deployment Artifacts

*under construction*
