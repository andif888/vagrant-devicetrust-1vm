#!/bin/bash -uex

export DEBIAN_FRONTEND=noninteractive
export LC_ALL=C

sudo apt-get -y update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
software-properties-common unzip git python3-dev python3-pip python3-wheel \
openssh-client libssl-dev libkrb5-dev krb5-user

sudo pip3 install ansible cryptography pywinrm kerberos requests_kerberos
