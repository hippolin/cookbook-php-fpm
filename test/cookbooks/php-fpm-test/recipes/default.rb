#
# Cookbook Name:: php-fpm-test
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

apt_repository 'ondrej-php' do
  uri 'ppa:ondrej/php'
  distribution node['lsb']['codename']
end

node.override['php-fpm']['user'] = "www-data"
node.override['php-fpm']['group'] = "www-data"
node.override['php-fpm']['conf_dir'] = "/etc/php/7.0/fpm/conf.d"
node.override['php-fpm']['pool_conf_dir'] = "/etc/php/7.0/fpm/pool.d"
node.override['php-fpm']['conf_file'] = "/etc/php/7.0/fpm/php-fpm.conf"
node.override['php-fpm']['pid'] = "/var/run/php/php7.0-fpm.pid"
node.override['php-fpm']['service_name'] = "php7.0-fpm"
node.override['php-fpm']['log_dir'] = '/var/log/php-fpm'
node.override['php-fpm']['error_log'] =  "/var/log/php7.0-fpm.log"
node.override['php-fpm']['package_name'] = 'php7.0-fpm'
