#!/bin/sh

if [[ -f $1/values.private.yaml ]]; then
  echo "Installing $1 with private values"
  helm install $1 --values=$1/values.private.yaml
else
  echo "Installing $1 with 'default' values"
  helm install $1
fi
