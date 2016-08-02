#!/bin/bash

npm install gitbook-cli -g
npm install --save gitbook-plugin-anchors

gitbook init
gitbook build

TARGET_DIR=_v2ray_com

git clone "https://github.com/v2ray/v2ray.github.io.git" ${TARGET_DIR}

rm -rf ${TARGET_DIR}/*
cp -r _book/* ${TARGET_DIR}/
cp CNAME ${TARGET_DIR}/
cp robots.txt ${TARGET_DIR}/

cd ${TARGET_DIR}

git config user.name "V2Ray Auto Build"
git config user.email "admin@v2ray.com"

git add -A
git commit -m 'update'
git push "https://${GIT_KEY}@github.com/v2ray/v2ray.github.io.git" master
