#!/bin/bash

function build_dir {
  DIR="$1"
  pushd $DIR
  rsync -rv ../_layouts/ ./_layouts/
  rsync -rv ../resources/ ./resources/
  cp ../donor.md ./donor.md
  gitbook init
  gitbook install
  gitbook build
  popd  
}

curl -o "./resources/github-release.svg" "https://img.shields.io/github/release/v2ray/v2ray-core.svg"

npm install gitbook-cli -g

build_dir zh_cn
build_dir en
build_dir blog

TARGET_DIR=_v2ray_com

git clone "https://github.com/v2ray/v2ray.github.io.git" ${TARGET_DIR}

rm -rf ${TARGET_DIR}/*
cp -r ./zh_cn/_book/* ${TARGET_DIR}/
mkdir ${TARGET_DIR}/zh_cn/
cp -r ./zh_cn/_book/* ${TARGET_DIR}/zh_cn/
mkdir ${TARGET_DIR}/en/
cp -r ./en/_book/* ${TARGET_DIR}/en/
mkdir ${TARGET_DIR}/blog/
cp -r ./blog/_book/* ${TARGET_DIR}/blog/
cp CNAME ${TARGET_DIR}/
cp robots.txt ${TARGET_DIR}/

pushd ${TARGET_DIR}
git config user.name "V2Ray Auto Build"
git config user.email "admin@v2ray.com"

git add -A
git commit -m 'update'
git push "https://${GIT_KEY}@github.com/v2ray/v2ray.github.io.git" master
popd
