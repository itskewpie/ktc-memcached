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
