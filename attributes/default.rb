
default['godns'] = {
  'download_url' => 'https://github.com/Scalingo/godns/releases/download/',
  'version' => 'v1.5.0',
  'arch' => 'amd64',
  'install_path' => '/usr/local/bin',
  'config_path' => '/etc/godns.conf',
  # If default_dns is set, it copies /etc/resolv.conf to node['godns']['resolv_conf']
  # and changes /etc/resolv.conf in order to use 127.0.0.1
  'default_dns' => false,
  'default_resolv_host' => '127.0.0.1',

  'debug' => false,
  'host' => '127.0.0.1',
  'port' => 53,

  'resolv' => {
    'file' => '/etc/resolv.conf.godns',
    'timeout' => 5,
    'setedns0' => true,
    'interval' => 200,
  },
  'redis' => {
    'url' => 'redis://127.0.0.1:6379',
  },
  'log' => {
    'stdout' => true,
    'file' => '',
    'level' => 'INFO',
  },
  'cache' => {
    'backend' => 'memory',
    'expire' => 600,
    'maxcount' => 0,
  },
  'hosts' => {
    'enable' => true,
    'file' => '/etc/hosts',
    'redis_enable' => true,
    'redis_key' => 'godns:hosts',
    'ttl' => 600,
    'refresh_interval' => 5,
    'zone' => nil,
    'zone-ns' => nil,
    'zone-mbox' => nil,
    'zone-serial' => nil,
    'zone-refresh' => nil,
    'zone-retry' => nil,
    'zone-expire' => nil,
    'zone-negcache-ttl' => nil,
    'zone-soa-ttl' => nil,
  },
}
