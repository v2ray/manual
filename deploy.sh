#!/bin/bash

set -x

curl -sL https://deb.nodesource.com/setup_7.x | bash -
apt-get update
apt-get -y install jq git file nodejs build-essential

function build_dir {
  DIR="$1"
  pushd $DIR
  rsync -rv ../_layouts/ ./_layouts/
  rsync -rv ../resources/ ./resources/
  gitbook init
  gitbook install
  gitbook build
  popd  
}

function getattr() {
  curl -s -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/$2/attributes/$1
}

GITHUB_TOKEN=$(getattr "github_token" "project")

git clone https://github.com/v2ray/manual.git
cd manual

curl -o "./resources/github-release.svg" "https://img.shields.io/github/release/v2ray/v2ray-core.svg"

npm install gitbook-cli -g

build_dir zh_cn
build_dir en
build_dir de
build_dir ru
build_dir eng_zh_cn
build_dir eng_en

TARGET_DIR=_v2ray_com

git clone "https://github.com/v2ray/v2ray.github.io.git" ${TARGET_DIR}

rm -rf ${TARGET_DIR}/*
cp -r ./zh_cn/_book/* ${TARGET_DIR}/
mkdir ${TARGET_DIR}/en/
cp -r ./en/_book/* ${TARGET_DIR}/en/
mkdir ${TARGET_DIR}/de/
cp -r ./de/_book/* ${TARGET_DIR}/de/
mkdir ${TARGET_DIR}/ru/
cp -r ./ru/_book/* ${TARGET_DIR}/ru/
mkdir ${TARGET_DIR}/eng/
cp -r ./eng_zh_cn/_book/* ${TARGET_DIR}/eng/
mkdir ${TARGET_DIR}/eng_en/
cp -r ./eng_en/_book/* ${TARGET_DIR}/eng_en/
cp -r ./_dev/* ${TARGET_DIR}/
cp CNAME ${TARGET_DIR}/
cp robots.txt ${TARGET_DIR}/
cp -r ./resources/* ${TARGET_DIR}/resources/

pushd ${TARGET_DIR}
git config user.name "V2Ray Auto Build"
git config user.email "admin@v2ray.com"

git add -A
git commit -m 'update'
git push "https://${GITHUB_TOKEN}@github.com/v2ray/v2ray.github.io.git" master
popd

shutdown -h now
