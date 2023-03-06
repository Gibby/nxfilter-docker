#!/usr/bin/env bash

if [ -z "$(ls -A /nxfilter/conf)" ]; then
   echo "Conf Empty, coping initial files"
   cp -a /root/conf /nxfilter/
else
   echo "Conf not empty, skipping copy"
fi

/nxfilter/bin/startup.sh
