#
# Cookbook Name:: godns
# Recipe:: default
#
# Copyright 2018, Soulou
#
# License MIT
#

require 'resolv'

dirname = 'godns_' +
           node['godns']['version'] + "_linux_" +
           node['godns']['arch']
archive = "#{dirname}.tar.gz"

download_url =
  node['godns']['download_url'] + '/' +
  node['godns']['version'] + '/' + archive

archive_dest_path = "#{Chef::Config[:file_cache_path]}/#{archive}"
dir_dest_path = "#{Chef::Config[:file_cache_path]}/#{dirname}"

remote_file archive_dest_path do
  source download_url
end

bash "extract godns #{node['godns']['version']}" do
  code <<-EOH
    tar -C #{Chef::Config[:file_cache_path]} -xvf #{archive_dest_path}
    mv #{dir_dest_path}/godns #{node['godns']['install_path']}
  EOH
  subscribes :run, "remote_file[#{archive_dest_path}]", :immediately
  action :nothing
end

template node['godns']['config_path'] do
  source 'godns.conf.erb'
  mode 06640
  notifies :restart, 'service[godns]', :delayed
end

binary_path = File.join(node['godns']['install_path'], 'godns')

manager = Chef::Provider::Service::Upstart

if node['init_package'] == 'systemd'
  manager = Chef::Provider::Service::Systemd
  systemd_unit 'godns.service' do
    action :create
    systemd_content = {
      'Unit' => {
        'Description' => 'GoDNS - DNS server backed by redis',
        'After' => 'network.target',
      },
      'Service' => {
        'ExecStart' => "#{binary_path} -c #{node['godns']['config_path']}",
        'Restart' => 'always',
        'RestartSec' => '30s',
      },
      'Install' => {
        'WantedBy' => 'multi-user.target',
      },
    }
    content systemd_content
  end
else
  template '/etc/init/godns.conf' do
    source 'godns.init.conf.erb'
    mode 0664
    variables(
      target: binary_path
    )
    notifies :stop, 'service[godns]', :delayed
    notifies :start, 'service[godns]', :delayed
  end
end

bash 'use current dns as godns upstream dns' do
  code <<-EOH
    cp /etc/resolv.conf #{node['godns']['resolv']['file']}
  EOH
  only_if do
    node['godns']['default_dns'] && !File.exist?(node['godns']['resolv']['file'])
  end
end

service 'godns' do
  provider manager
  subscribes :restart, "remote_file[#{archive_dest_path}]"
  action [:enable, :start]
end
