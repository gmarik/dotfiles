#!/bin/bash

txtred='[0;31m' # Red
txtrst='[0m'    # Reset

if [ -z $(git diff --cached | egrep ">>>>>>>|<<<<<<<") ]; then
  exit 0
fi

echo ${txtred}
echo "merge conflict debris detected"
echo ${txtrst}
exit 1

# vim: set ft=sh:

