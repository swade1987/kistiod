#!/usr/bin/env bash

set -euo pipefail

VERSION=$1
REPO_ROOT=$(git rev-parse --show-toplevel)

mkdir -p "${REPO_ROOT}"/resources/istio/"${VERSION}"/profiles

docker run --rm --name "${VERSION}" \
istio/istioctl:"${VERSION}" \
profile dump default > "${REPO_ROOT}"/resources/istio/"${VERSION}"/profiles/default.yaml

docker run --rm --name "${VERSION}" \
istio/istioctl:"${VERSION}" \
profile dump demo > "${REPO_ROOT}"/resources/istio/"${VERSION}"/profiles/demo.yaml

docker run --rm --name "${VERSION}" \
istio/istioctl:"${VERSION}" \
operator dump > "${REPO_ROOT}"/resources/istio/"${VERSION}"/istio-operator.yaml

echo "Istio operator ${VERSION} manifests updated"