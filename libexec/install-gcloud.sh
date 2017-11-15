#!/bin/sh -e

if test -d ~/google-cloud-sdk; then
  echo "ERROR: google-cloud-sdk: already installed" >&2
  exit 1
fi

version=$(curl -sL curl -sL https://cloud.google.com/sdk/docs/release-notes | perl -lne 'if (/^<h2[^>]*>([^ ]+) [^ ]*<\/h2>$/) { print $1; exit }')
curl -sL -o /tmp/gcloud.tar.gz https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${version}-linux-x86_64.tar.gz

tar -C ~ -xzf /tmp/gcloud.tar.gz
rm -f /tmp/gcloud.tar.gz

unset version
