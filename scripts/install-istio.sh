#!/usr/bin/env bash

set -e

if [[ ! -x "$(command -v kubectl)" ]]; then
    echo "kubectl not found"
    exit 1
fi

ISTIO_VERSION=$1
REPO_ROOT=$(git rev-parse --show-toplevel)

echo ">>> Installing Istio Operator at version ${ISTIO_VERSION} ..."
kubectl create ns istio-operator || true
kubectl apply -f "${REPO_ROOT}"/resources/istio/"${ISTIO_VERSION}"/istio-operator.yaml

echo ">>> Waiting for the operator to be deployed"
until kubectl get pods -n istio-operator | grep "1/1"
do
  sleep 5
done
echo ">>> Istio operator pod is ready"

echo ">>> Installing Istio control plane at version ${ISTIO_VERSION} ..."
kubectl create ns istio-system || true
kubectl apply -f "${REPO_ROOT}"/resources/istio/"${ISTIO_VERSION}"/istio-control-plane.yaml

echo ">>> Waiting for the istiod pod to be ready"
until kubectl get pods -n istio-system | grep istiod | grep "1/1"
do
  sleep 5
done
echo ">>> Istiod pod is ready"

echo ">>> Waiting for the istio-ingressgateway pod to be ready"
until kubectl get pods -n istio-system | grep istio-ingressgateway | grep "1/1"
do
  sleep 5
done
echo ">>> istio-ingressgateway pod is ready"

echo ">>> Cluster bootstrap done!"