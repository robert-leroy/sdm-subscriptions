#!/bin/sh

set -e

# Generate SSH host keys if they don't exist
if [ ! -f /etc/ssh/ssh_host_rsa_key ]; then
    ssh-keygen -A
fi

# Start SSH daemon in background with proper configuration
/usr/sbin/sshd -D &

exec nginx -g "daemon off;"