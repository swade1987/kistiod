SHELL = /bin/sh
ISTIO_VERSION := 1.6.3

cluster:
	kind create cluster \
	--config kind/config.yaml \
	--kubeconfig ~/.kube/kind-poc-istio \
	--name poc-istio

destroy:
	kind delete cluster --name poc-istio

init-istio:
	./scripts/istio-init.sh ${ISTIO_VERSION}

install-istio:
	./scripts/install-istio.sh ${ISTIO_VERSION}

portforward-grafana:
	kubectl port-forward -n istio-system deployment/grafana 3000:3000

portforward-prometheus:
	kubectl port-forward -n istio-system deployment/prometheus 9090:9090
