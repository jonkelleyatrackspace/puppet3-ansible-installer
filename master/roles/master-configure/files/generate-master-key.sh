#!/bin/bash
# Placed by puppet3-ansible-installer

# This script is to be run on the master in order to generate the SSL CA Keys for the JVM.
#  For some reason Puppetlabs still wants us to run the old ruby master for one last time.

# Ansible just can't fork processes and then sweep them up with the SIGKILL like BASH can.
#  Thank you Steven Bourne.

/usr/bin/puppet master&                       # Start the ruby master to gen some keys
sleep 10                                      # Wait for some keys to gen
echo "Time to die. Thanks for all the certs." # Message
pkill -U puppet                               # Kill master

