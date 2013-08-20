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

d = get_openstack_service_template(get_interface_address("management"), "11211")
register_member("memcached", d)

node.default["memcached"]["listen"] = get_interface_address "management"

include_recipe "openstack-object-storage::memcached"
