
if node['php-fpm']['package_name'].nil?
  if platform_family?("rhel", "fedora")
    php_fpm_package_name = "php-fpm"
  else
    php_fpm_package_name = "php#{node['php']['version']}-fpm"
  end
else
  php_fpm_package_name = node['php-fpm']['package_name']
end

if node['php-fpm']['service_name'].nil?
  php_fpm_service_name = php_fpm_package_name
else
  php_fpm_service_name = node['php-fpm']['service_name']
end

service_provider = nil
if node['platform'] == 'ubuntu'
  if node['platform_version'].to_f >= 13.10 and node['platform_version'].to_f < 16.0
    service_provider = ::Chef::Provider::Service::Upstart
  elsif node['platform_version'].to_f >= 16.0
    service_provider = ::Chef::Provider::Service::Systemd
  end
end

service 'php-fpm' do
  provider service_provider if service_provider
  service_name php_fpm_service_name
  supports :start => true, :stop => true, :restart => true, :reload => true
  action :nothing
end
