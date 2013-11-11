#
default["memcached"]["listen"] = "0.0.0.0"
default["memcached"]["port"] = "11211"

# process monitoring
default["memcached"]["processes"] = [
  { "name" => "memcached", "shortname" => "memcached" }
]
