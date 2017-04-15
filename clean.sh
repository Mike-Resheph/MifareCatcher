#!/usr/bin/env bash
# By Resheph @ www.postexplo.com
# This script will remove captures with the filesize of 0.

FOLDER="dumps/*"

echo "[!] This will remove all failed captures!"
echo "[!] Are you sure you wanna do this? Press Ctrl^C now if you are not sure!"
read ANSWER
echo "[*] Removing all empty files!"

for f in $FOLDER; do
    if [ ! -s $f ] ; then
        rm $f
    fi
done

echo "[*] Done..."
