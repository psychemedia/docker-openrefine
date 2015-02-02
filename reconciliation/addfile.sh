#!/bin/bash

if [ ! -f /data/$RECONFILE ]; then
    mkdir -p /data
    mv /tmp/import/$RECONFILE /data/$RECONFILE
fi