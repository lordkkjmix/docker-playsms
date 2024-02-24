#!/bin/bash
# Start php 8.0 service
service php8.0-fpm start
# Start Nginx service
service nginx start

# Keep the container running
tail -f /dev/null