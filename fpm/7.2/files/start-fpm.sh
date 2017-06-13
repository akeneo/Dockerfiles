#!/usr/bin/env bash

set -euo pipefail

# Configure PHP FPM
sed -i "s/user = www-data/user = $UID/g" /etc/php/7.2/fpm/pool.d/www.conf
sed -i "s/group = www-data/group = $GROUPS/g" /etc/php/7.2/fpm/pool.d/www.conf
sed -i "s/listen = .*/listen = 9001/g" /etc/php/7.2/fpm/pool.d/www.conf

# Run FPM in foreground
php-fpm7.2 -F
