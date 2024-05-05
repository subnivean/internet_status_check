#!/bin/bash

THISDIR=$(dirname $0)
OUTFILE="$THISDIR/internet_status.log"

if [[ "$(ping -c 3 -W 3 8.8.8.8 | grep '100% packet loss' )" != "" ]]; then
  echo "{\"timestamp\":\"$(date -I'seconds')\",\"status\":0}" | tee -a $OUTFILE
else
  echo "{\"timestamp\":\"$(date -I'seconds')\",\"status\":1}" | tee -a $OUTFILE
fi
