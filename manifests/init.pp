# == Class: erlang
#
# Module to install an up-to-date version of Erlang from the
# official repositories 
#
# === Parameters
# [*version*]
#   The package version to install, passed to ensure.
#   Defaults to present.
#
#
class erlang(
  $version = 'present',
) 
{
  validate_string($version)

  case $::osfamily {
    'Debian':  {
      include apt
      apt::source { 'erlang':
        location   => 'http://binaries.erlang-solutions.com/debian',
        repos      => 'contrib',
        key        => 'A14F4FCA',
        #key_source => 'http://binaries.erlang-solutions.com/debian/erlang_solutions.asc',
      }
      package { 'erlang':
        ensure  => $version,
        require => Apt::Source['erlang'],
      }
    }
    'RedHat': {
      class { 'epel': }
      package { 'erlang':
        ensure  => $version,
        require => Class['epel']
      }
    }
    default:  {
      raise Puppet::Error, "Your operating system is not supported."
    }
  }
}
