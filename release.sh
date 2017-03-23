#!/bin/bash

PROJECT=$1

echo "Launching build machine."
DIR="$(dirname "$0")"
gcloud compute instances create "v2raycom" \
    --machine-type=n1-highcpu-2 \
    --metadata-from-file=startup-script=${DIR}/release.sh \
    --zone=us-west1-a \
    --project ${PROJECT}
