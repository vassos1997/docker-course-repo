#!/bin/sh

echo "Running Laravel database migrations..."
# Run migrations, forcing them since we are in production
php artisan migrate --force

echo "Starting PHP-FPM server..."
# Execute the main command (CMD) passed to the Docker container
exec "$@"
