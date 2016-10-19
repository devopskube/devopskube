#!/bin/sh
helm install $1 --values=$1/values.private.yaml
