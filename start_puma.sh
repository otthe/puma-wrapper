#!/bin/bash

# replace my-app with your actual app name
# also set correct ruby version

source /etc/profile.d/rvm.sh
cd /var/www/my-app
exec /usr/local/rvm/gems/ruby-3.3.0/wrappers/puma -C /var/www/my-app/config/puma.rb