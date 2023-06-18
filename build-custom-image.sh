#!/bin/bash

APPS_JSON='[
  {
    "url": "https://github.com/ccggyy/erpnext.git",
    "branch": "version-14"
  },
  {
   "url": "https://github.com/ccggyy/hrms.git",
   "branch": "version-14"
  },
  {
   "url": "https://gitee.com/yuzelin/erpnext_chinese.git",
   "branch": "master"
  }
]'

APPS_JSON_BASE64=$(echo ${APPS_JSON} | base64 -w 0)

docker build \
  --build-arg=PYTHON_VERSION=3.10.12 \
  --build-arg=APPS_JSON_BASE64=$APPS_JSON_BASE64 \
  --tag=ccggyy/erpnext:0.0.1 \
  --file=images/custom/Containerfile .
