#!/bin/bash
OPTS=""
if [[ "$1" == /tmp/* ]]; then
    OPTS="-w"
fi

/usr/bin/code ${OPTS:-} -a "$@"
