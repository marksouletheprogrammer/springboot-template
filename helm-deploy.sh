#!/bin/sh

docker build . -t spring-template-demo
helm upgrade spring-template-demo helm/spring-template-demo --namespace improving --install -f ./helm/values-local.yaml
