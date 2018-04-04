#!/bin/sh
set -e

# Apache gets grumpy about PID files pre-existing
rm -f /usr/local/apache/logs/httpd.pid

exec /usr/local/apache/bin/httpd -DFOREGROUND
