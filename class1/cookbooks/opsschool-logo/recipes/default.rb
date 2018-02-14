apt_update 'update'

apt_package 'nginx' do 
  action :install 
end

directory node['nginx']['directory'] do
  owner node['nginx']['user']
  group node['nginx']['user']
  mode '0755'
  action :create
end

template "#{node['nginx']['directory']}/index.html" do
  source logo.nginx-conf.erb
  mode '0755'
  owner node['nginx']['user']
  group node['nginx']['user']
  action :create
end

remote_file "#{node['nginx']['directory']}/logo.png" do
  source node['nginx']['logo_url']
  owner node['nginx']['user']
  group node['nginx']['user']
  mode '0755'
  action :create
end

file '/etc/nginx/sites-enabled/default' do
  action :delete
end


link '/etc/nginx/sites-available/logo' do
  to '/etc/nginx/sites-enabled/'
  link_type :symbolic
  action :create
end

service "nginx" do
  action :reload
end