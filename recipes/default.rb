#
# Cookbook Name:: ktc-memcached
# Recipe:: default
#
# Copyright 2013, KT Cloudstack
#
# All rights reserved - Do Not Redistribute
#

class Chef::Recipe
  include KTCUtils
end

node.default["memcached"]["listen"] = get_interface_address "management"

include_recipe "openstack-object-storage::memcached"
