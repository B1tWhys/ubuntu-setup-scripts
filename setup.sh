#!/bin/bash

# many of these steps blatently stolen from https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-18-04

if [ "`whoami`" -ne "root" ]; then
    echo "this script should be run as root, not as `whoami`. exiting"
    exit
fi

read -p 'admin username [skyler]: ' adminUsername
adminUsername=${adminUsername:-username}

echo "creating admin user: $adminUsername"
adduser $adminUsername
usermod -aG sudo "$adminUsername"

echo "apt update/upgrade"
apt update -y
apt upgrade -y

echo "install ufw"
apt install ufw

