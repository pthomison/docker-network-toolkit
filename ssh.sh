#!/usr/bin/env bash

set -ex

SCRIPTS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

BASTION_USER=$1
BASTION_IP=$2
BASTION_KEY_LOCATION=$3
INSTANCE_USER=$4
INSTANCE_IP=$5
INSTANCE_KEY_LOCATION=$6

pushd $SCRIPTS_DIR

docker build . -t network-toolkit

docker run \
-it \
--rm \
-v "$HOME/.ssh:/root/.ssh" \
--entrypoint="" \
network-toolkit:latest \
/bin/bash -l -c "ssh-add $BASTION_KEY_LOCATION; ssh-add $INSTANCE_KEY_LOCATION; jump $BASTION_USER $BASTION_IP $BASTION_KEY_LOCATION $INSTANCE_USER $INSTANCE_IP $INSTANCE_KEY_LOCATION"

popd