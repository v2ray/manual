#!/bin/bash

PROJECT=$1

echo "Removing previous machines."
gcloud compute instances list --project ${PROJECT} | grep TERMINATED \
| awk '{printf "%s --zone %s\n", $1, $2}' \
| while read LINE; do
  yes Y | gcloud compute instances delete ${LINE} --project ${PROJECT}
done

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