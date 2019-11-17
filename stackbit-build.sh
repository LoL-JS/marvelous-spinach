#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5d9dfcb67248f6001ae61586/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5d9dfcb67248f6001ae61586
curl -s -X POST https://api.stackbit.com/project/5d9dfcb67248f6001ae61586/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://api.stackbit.com/project/5d9dfcb67248f6001ae61586/webhook/build/publish > /dev/null
