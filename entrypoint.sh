#!/bin/bash
set -e

# Close existing running server process
rm -f /myapp/tmp/pids/server.pid

# Execute container's main process
exec "$@"
