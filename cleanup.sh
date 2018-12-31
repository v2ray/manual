#!/bin/bash

PROJECT=$1

echo "Removing previous machines."
gcloud compute instances list --project ${PROJECT} | grep TERMINATED \
| awk '{printf "%s --zone %s\n", $1, $2}' \
| while read LINE; do
  gcloud --quiet compute instances delete ${LINE} --project ${PROJECT}
done
