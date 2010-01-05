#!/bin/sh
CHANGESETS=`echo "$@"|tr -d '#rc,'|tr ' ' '\n'|sort -n`

for c in $CHANGESETS; do 
  svn diff -c$c svn://scm.ratepoint.com/rp-badge-signup/ 
done

