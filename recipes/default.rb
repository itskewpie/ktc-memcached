#
# Cookbook Name:: ktc-memcached
# Recipe:: default
#
# Copyright 2013, KT Cloudstack
#
# All rights reserved - Do Not Redistribute
#

include_recipe "services"
include_recipe "ktc-utils"

ip = KTC::Network.address "management"

Services::Connection.new run_context: run_context
member = Services::Member.new node[:fqdn],
  service: "memcached",
  port: 11211,
  proto: "tcp",
  ip: ip

member.save

node.default["memcached"]["listen"] = ip

include_recipe "openstack-object-storage::memcached"

# process monitoring and sensu-check config
processes = node['memcached']['processes']

processes.each do |process|
  sensu_check "check_process_#{process['name']}" do
    command "check-procs.rb -c 10 -w 10 -C 1 -W 1 -p #{process['name']}"
    handlers ["default"]
    standalone true
    interval 20
  end
end

collectd_processes "memcached-processes" do
  input processes
  key "shortname"
end
