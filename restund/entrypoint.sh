#!/usr/bin/env bash
set -e

if [ "$1" = 'restund' ]; then
    /bin/restund "$@"
else
    exec "$@"
fi
