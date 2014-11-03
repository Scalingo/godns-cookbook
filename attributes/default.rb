
default["godns"] = {
  "download_url" => "https://github.com/Scalingo/godns/releases/download/",
  "version" => "v1.1",
  "arch" => "amd64",
  "install_path" => "/usr/local/bin",
  "config_path" => "/etc/godns.conf",
  # If default_dns is set, it copies /etc/resolv.conf to node['godns']['resolv_conf']
  # and changes /etc/resolv.conf in order to use 127.0.0.1
  "default_dns" => false,

  "debug" => false,
  "host" => "127.0.0.1",
  "port" => 53,
  "log_file" => "", # stdout
  "resolv_conf" => "/etc/resolv.conf.godns",
  "resolv_timeout" => 5,
  "redis" => {
    "url" => "redis://127.0.0.1:6379"
  },
  "cache" => {
    "backend" => "memory",
    "expire" => 600,
    "maxcount" => 0
  },
  "hosts" => {
    "enable" => true,
    "file" => "/etc/hosts",
    "redis_key" => "godns:hosts",
    "ttl" => 600
  }
}
