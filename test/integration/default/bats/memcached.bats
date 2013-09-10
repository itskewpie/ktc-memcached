# vim: ft=sh:

@test "memcached registered with etcd" {
  curl http://127.0.0.1:4001/v1/keys/services/memcached/members
}

@test "memcached is running" {
  netstat -tan | grep 11211
}

#@test "memcached stats ok" {
#  /opt/busser/suites/bats/status.sh | telnet
#}
