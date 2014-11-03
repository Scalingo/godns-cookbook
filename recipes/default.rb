#
# Cookbook Name:: godns
# Recipe:: default
#
# Copyright 2014, Soulou
#
# License MIT
#
 
dirname = "godns-" +
           node['godns']['version'] + "-linux-" +
           node['godns']['arch']
archive = "#{dirname}.tar.gz"

download_url = 
  node['godns']['download_url'] + "/" +
  node['godns']['version'] + "/" + archive

archive_dest_path = "#{Chef::Config[:file_cache_path]}/#{archive}"
dir_dest_path = "#{Chef::Config[:file_cache_path]}/#{dirname}"

remote_file archive_dest_path do
  source download_url
end

bash "extract godns #{node['godns']['version'] }" do
  code <<-EOH
    tar -C #{Chef::Config[:file_cache_path]} -xvf #{archive_dest_path}
    cp #{dir_dest_path}/godns #{node['godns']['install_path']}
  EOH
  subscribes :run, "remote_file[#{archive_dest_path}]"
  action :nothing
end

template node['godns']['config_path'] do
  source 'godns.conf.erb'
  mode 06640
  notifies :restart, "service[godns]", :delayed
end

template "/etc/init/godns.conf" do
  source 'godns.init.conf.erb'
  mode 0664
  variables({
    target: File.join(node['godns']['install_path'], "godns"),
  })
  notifies :stop, "service[godns]", :delayed
  notifies :start, "service[godns]", :delayed
end

bash "setup godns as default dns" do
  code <<-EOH
    cp /etc/resolv.conf #{node['godns']['resolv_conf']}
    echo -e "nameserver #{node['godns']['default_resolv_host']}\n" > /etc/resolv.conf
  EOH
  only_if do
    node['godns']['default_dns'] and not File.exists?(node['godns']['resolv_conf'])
  end
end

service 'godns' do
  provider Chef::Provider::Service::Upstart
  subscribes :restart, "remote_file[#{dest_path}]"
  action [:enable]
end

