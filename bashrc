#!/usr/bin/env bash

set -xe

#
# setup ssh-agent
#
eval `ssh-agent -s` > /dev/null
