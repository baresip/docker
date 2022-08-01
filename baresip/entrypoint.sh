#!/usr/bin/env bash
set -e

if [ "$1" = 'baresip' ]; then
    /usr/bin/baresip "$@"
else
    exec "$@"
fi
