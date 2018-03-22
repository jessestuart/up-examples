#!/bin/bash

#
# All NodeJS configurations.
#
BINS=("node")
MIRROR=(${NODE_MIRROR-https://nodejs.org/dist/})
BIN_NAME=("node")
VERSIONS_DIR=($BASE_VERSIONS_DIR/node)

#
# Ensure we have curl or wget support.
#
CURL_PARAMS=( "-L"
              "-#")
WGET_PARAMS=( "--no-check-certificate"
              "-q"
              "-O-")

GET=
command -v wget > /dev/null && GET="wget ${WGET_PARAMS[@]}"
command -v curl > /dev/null && GET="curl ${CURL_PARAMS[@]}" && QUIET=false
test -z "$GET" && abort "curl or wget required"

display_latest_version() {
  $GET 2> /dev/null ${MIRROR[$DEFAULT]} \
    | egrep "</a>" \
    | egrep -o '[0-9]+\.[0-9]+\.[0-9]+' \
    | egrep -v '^0\.[0-7]\.' \
    | egrep -v '^0\.8\.[0-5]$' \
    | sort -u -k 1,1n -k 2,2n -k 3,3n -t . \
    | tail -n1
}

echo "v$(display_latest_version)"
