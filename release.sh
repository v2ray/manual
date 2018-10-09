#!/bin/bash

git pull | grep -q -v 'Already up-to-date.' && CHANGED=1

if [[ "$CHANGED" != "1" ]]; then
  echo "Nothing to deploy"
  exit 0
fi

PROJECT=$1

echo "Launching build machine."
DIR="$(dirname "$0")"
RAND="$(openssl rand -hex 5)"
ZONES=("us-central1-b" "us-central1-c" "europe-west1-d" "us-east1-d")

for zone in "${ZONES[@]}"; do
gcloud compute instances create "v2raycom-${RAND}" \
    --machine-type=n1-highcpu-2 \
    --metadata-from-file=startup-script=${DIR}/deploy.sh \
    --zone=${zone} \
    --project ${PROJECT}
if [ $? -eq 0 ]; then
  exit 0
fi
done
