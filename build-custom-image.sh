#!/bin/bash

export APPS_JSON='[
  {
    "url": "https://github.com/ccggyy/erpnext.git",
    "branch": "version-14"
  },
  {
   "url": "https://github.com/ccggyy/hrms.git",
   "branch": "version-14"
  },
  {
   "url": "https://github.com/ccggyy/erpnext_chinese.git",
   "branch": "master"
  }
]'

export APPS_JSON_BASE64=$(echo ${APPS_JSON} | base64 -w 0)

docker build \
  --build-arg=PYTHON_VERSION=3.10.12 \
  --build-arg=WKHTMLTOPDF_VERSION=0.12.6-1 \
  --build-arg=NODE_VERSION=16.18.0 \
  --build-arg=APPS_JSON_BASE64=$APPS_JSON_BASE64 \
  --build-arg=FRAPPE_BRANCH=version-14 \
  --build-arg=FRAPPE_PATH=https://github.com/ccggyy/frappe \
  --tag=ccggyy/erpnext:0.0.1 \
  --file=images/custom/Containerfile .
