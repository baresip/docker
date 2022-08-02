#!/usr/bin/env bash
set -e

if [ "$1" = 'restund' ]; then
    /usr/sbin/restund "$@"
else
    exec "$@"
fi
