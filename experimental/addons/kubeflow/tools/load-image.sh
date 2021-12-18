#!/usr/bin/env bash

set -ex

for NS in cert-manager istio-system auth knative-eventing knative-serving kubeflow kubeflow-user-example-com
do
  podnames=$(kubectl get pods -n $NS | sed '1d' | cut -d' ' -f1)
  for podname in $podnames
  do
    for podimage in $(kubectl -n $NS get pod $podname -o jsonpath='{.spec.containers[*].image}')
    do
      docker pull $podimage
      kind load docker-image $podimage
    done
  done

  sleep 3
  for podname in $podnames
  do
    kubectl -n $NS delete pod $podname
  done
done

