# == Class: rhel
#
#
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { sysdoc:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Toni Schmidbauer <toni@stderr.at>
#
# === Copyright
#
# Copyright 2014 Toni Schmibauer
#
class rhel {

  service { 'iptables':
    ensure    => stopped,
  }

  # install required packages
  #
  package { 'git':
    ensure  => 'latest',
    require => Augeas['yum.conf'],
  }

  package { 'vim-enhanced':
    ensure  => 'latest',
    require => Augeas['yum.conf'],
  }

  package { 'puppet':
    ensure   => '3.2.4-1.el6',
    require => Augeas['yum.conf']
  }

  package { 'hiera':
    ensure  => '1.3.2-1.el6',
    require => Augeas['yum.conf']
  }

  # change various config files
  #
  augeas { 'yum.conf':
    changes => [
                'set /files/etc/yum.conf/main/proxy http://proxy-sd2.s-mxs.net:8080',
                ],
  }

  augeas { 'sudoers':
    context => '/files/etc/sudoers',
    changes => [
                'set */env_keep[var="SSH_AUTH_SOCK"]/var[. = "https_proxy"] https_proxy',
                'set */env_keep[var="SSH_AUTH_SOCK"]/var[. = "http_proxy"] http_proxy',
                ],
  }

  augeas { 'puppetconf':
    context => '/files/etc/puppet/puppet.conf',
    changes => [
                'set production/modulepath "$confdir/forge:$confdir/modules"',
                'set agent/server "192.168.1.2"',
                ],
  }
}
