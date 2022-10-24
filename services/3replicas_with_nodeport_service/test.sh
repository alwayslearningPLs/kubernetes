#!/bin/bash

kubectl apply -f ./manifest.yaml

kubectl run client --tty -i --rm --image=alpine:3.16 \
  -n test -- /bin/sh -c "apk add bind-tools curl && dig proxy.test.svc.cluster.local. && curl http://proxy.test.svc.cluster.local.:9090"

exit 0

# I'm running a rancher desktop environment with traefik.
kubectl get clusterroles/traefik -o yaml

kubectl get serviceaccount/traefik -o yaml -n kube-system

kubectl get clusterrolebinding/traefik -o yaml -n kube-system

kubectl get deployment/traefik -o yaml -n kube-system

