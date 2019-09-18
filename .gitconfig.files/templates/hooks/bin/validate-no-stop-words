#!/bin/bash

txtred='[0;31m' # Red
txtrst='[0m'    # Reset

STOPWORDS="binding.pry|>>>>>>|<<<<<<<"

OUT=$(git diff --cached | egrep "$STOPWORDS")

if [ -n "$OUT" ]; then
echo ${txtred} >&2
echo "stop word(s) detected: $OUT" >&2
echo ${txtrst} >&2
fi

exit 0

# vim: set ft=sh:

