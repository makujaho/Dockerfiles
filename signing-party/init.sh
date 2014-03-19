#!/bin/bash

# comment out these two lines and execute...it uses whoami for user
echo PLEASE READ THE SCRIPT CAREFULLY BEVOR EXECUTING
exit 1

user=$(whoami)

passwd=$(grep "${user}" /etc/passwd)
shadow=$(sudo grep "${user}" /etc/shadow | awk -F: '{for(i=1; i<=NF;i++) { if (i != 2) { printf "%s",$i} if(i != NF) {printf "%s",":" }}}')
home=$(echo "${passwd}" | awk -F: '{print $6}')

# rewrite shell
passwd=$(echo "${passwd}" | sed 's/zsh/bash/')

cat Dockerfile.template | sed "s|{PASSWD}|${passwd}|g;s|{USER}|${USER}|g;s|{SHADOW}|${shadow}|;s|{HOME}|${home}|g"
