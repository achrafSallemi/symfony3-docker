#!/bin/sh
set -e

echo "Installing dependencies.." >&2
composer install >&2

exec "$@"

echo fin.