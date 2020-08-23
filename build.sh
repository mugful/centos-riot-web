#!/bin/bash

set -euxo pipefail

yum -y install epel-release
yum -y install jq httpd
yum clean all


RELEASE_ARCHIVE=$(curl -s https://api.github.com/repos/vector-im/element-web/releases/latest | jq -r '.assets | map(.browser_download_url | select(test("tar.gz$")))[0]')
LOCAL_ARCHIVE=/tmp/element-web.tar.gz
ELEMENT_PATH=/var/www/html/element-web

mkdir "$ELEMENT_PATH"
curl -Lo "$LOCAL_ARCHIVE" "$RELEASE_ARCHIVE"
tar -C "$ELEMENT_PATH" --strip-components 1 -xvzf "$LOCAL_ARCHIVE"
