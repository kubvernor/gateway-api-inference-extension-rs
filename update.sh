#!/bin/bash

# ------------------------------------------------------------------------------
# This script will automatically generate API updates for new Gateway API
# releases. Update the $VERSION to the new release version before executing.
#
# This script requires kopium, which can be installed with:
#
#   cargo install kopium
#
# See: https://github.com/kube-rs/kopium
# ------------------------------------------------------------------------------

set -eou pipefail


APIS=(
    inferencemodels
    inferencepools
)

APIS=(
    inferencemodels
    inferencepools
)

export APIS_DIR='gateway-api-inference-extension/src/'
rm -rf $APIS_DIR/inference/

mkdir -p $APIS_DIR/inference/


echo "// WARNING! generated file do not edit" > $APIS_DIR/inference/mod.rs

for API in "${APIS[@]}"
do
    echo "generating api ${API}"
    curl -sSL "https://raw.githubusercontent.com/kubernetes-sigs/gateway-api-inference-extension/refs/heads/main/config/crd/bases/inference.networking.x-k8s.io_${API}.yaml" | kopium --schema=derived --derive=JsonSchema --derive=Default --derive=PartialEq --docs -f - > $APIS_DIR/inference/${API}.rs
    echo "pub mod ${API};" >> $APIS_DIR/inference/mod.rs
done



cargo fmt

