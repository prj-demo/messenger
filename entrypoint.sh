#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /usr/src/app/tmp/pids/server.pid

echo "bundle install..."
bundle check || bundle install --jobs 4

# Create or migrate database
echo "Preparing database..."
bin/rails db:prepare
echo "Database is ready!"

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"