# kistiod (Istio in KinD)

A repository for running [Istio](https://istio.io/) in [KinD](https://kind.sigs.k8s.io/)

## Pre-requisites

A list of pre-requisites can be found [here](docs/pre-reqs.md).

## Setup

1. Create a cluster using `make cluster`

2. **Make sure you export your new kubeconfig (use the command below)**
   
   ```
   export KUBECONFIG=~/.kube/kind-poc-istio
   ```

3. Install the [Istio Operator](https://github.com/istio/istio/tree/master/operator) using `make install-istio`

## Upgrading Istio

To upgrade Istio versions change `ISTIO_VERSION` in the `Makefile` and then run `make init-istio`

## Useful Links

The following are useful links for the Istio Operator:

- [Component specification](https://github.com/istio/api/blob/master/operator/v1alpha1/component.proto)
