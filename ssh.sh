#!/usr/bin/env bash

SCRIPTS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

pushd $SCRIPTS_DIR

docker build . -t network-toolkit

docker run \
-it \
--rm \
-v "$HOME/.ssh:/root/.ssh" \
network-toolkit:latest \
/bin/bash

popd