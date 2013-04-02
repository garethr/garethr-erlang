Puppet module for installing Erlang from the official repositories
mentined on the [Erlang
docs](https://www.erlang-solutions.com/downloads/download-erlang-otp).
This module is also available on the [Puppet
Forge](https://forge.puppetlabs.com/garethr/erlang)

[![Build
Status](https://secure.travis-ci.org/garethr/garethr-erlang.png)](http://travis-ci.org/garethr/garethr-erlang)

## Usage

The module includes a single class:

    include 'erlang'

By default this sets up the repository and installs the erlang package.
