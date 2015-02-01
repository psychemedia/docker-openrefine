#!/bin/bash

if [ ! -f /data/$RECONFILE ]; then
    mkdir -p /data
    cp /tmp/import/$RECONFILE /data/$RECONFILE
fi