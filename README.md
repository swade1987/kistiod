# kistiod

A repository for running [Istio](https://istio.io/) in [KinD](https://kind.sigs.k8s.io/)

## Pre-requisites

A list of pre-requisites can be found [here](docs/pre-reqs.md).

## Setup

1. To configure this to work with your repository first read the steps [here](docs/configuration.md).

2. Create a cluster using `make cluster`

3. **Make sure you export your new kubeconfig (use the command below)**
   
   ```
   export KUBECONFIG=~/.kube/kind-poc-istio
   ```

4. Install the [Istio Operator](https://github.com/istio/istio/tree/master/operator) using `make install-flux`

## Upgrading Istio

To upgrade Istio versions change `ISTIO_VERSION` in the `Makefile` and then run `make init-istio`

## Useful Links

The following are useful links for the Istio Operator:

- [Component specification](https://github.com/istio/api/blob/master/operator/v1alpha1/component.proto)