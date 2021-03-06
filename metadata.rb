name             'ktc-memcached'
maintainer       'KT Cloudware'
maintainer_email 'wil.reichert@kt.com'
license          'All rights reserved'
description      'Installs/Configures ktc-memcached'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.2.5'

%w{ centos ubuntu }.each do |os|
  supports os
end

depends "ktc-monitor"
depends "ktc-utils"
depends "openstack-common", "~> 0.4.3"
depends "openstack-object-storage", "~> 1.1.0"
depends "services"
