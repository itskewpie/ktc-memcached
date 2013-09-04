# vim: ft=sh:

@test "memcached registered with etcd" {
  wget http://localhost:4001/v1/keys/services/memcached/members
}

@test "memcached is running" {
  netstat -tan | grep 11211
}
