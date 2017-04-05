#!/bin/bash

PROJECT=$1

echo "Launching build machine."
DIR="$(dirname "$0")"
RAND="$(openssl rand -hex 5)"
gcloud compute instances create "v2raycom-${RAND}" \
    --machine-type=n1-highcpu-2 \
    --metadata-from-file=startup-script=${DIR}/deploy.sh \
    --zone=us-west1-a \
    --preemptible \
    --project ${PROJECT}
