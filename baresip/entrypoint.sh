#!/usr/bin/env bash
set -e

if [ "$1" = 'baresip' ]; then
    chown -R baresip /baresip
    shift
    su baresip -s /usr/bin/baresip -- "$@"
else
    exec "$@"
fi
