#!/usr/bin/env bash
# By Resheph @ www.postexplo.com
# This script will display all captures and an md5sum to find duplets.

FOLDER="dumps/*"

for f in $FOLDER; do
    ls $f | tr "\n" " "; cat $f | md5sum
done
