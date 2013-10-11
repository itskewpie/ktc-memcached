# vim: ft=sh:

@test "memcached registered with etcd" {
  curl http://127.0.0.1:4001/v1/keys/services/memcached/members
}

@test "memcached is running" {
  netstat -tan | grep 11211
}

@test "memcached stats ok" {
  ip=`/sbin/ifconfig eth0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'`
  echo "stats" | nc $ip 11211 | grep "STAT pid"
}
