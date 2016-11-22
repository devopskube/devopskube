#!/bin/sh
if [[ -f $1/Makefile ]]; then
  echo "Running pre-requisites using make"
  pushd $1
  make build
  popd
fi

if [[ -f $1/requirements.yaml ]]; then
  echo "Installing dependencies"
  pushd $1
  helm dependency update
  popd
fi

if [[ -f $1/values.private.yaml ]]; then
  echo "Installing $1 with private values"
  helm install $1 --values=$1/values.private.yaml
else
  echo "Installing $1 with 'default' values"
  helm install $1
fi
