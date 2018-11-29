# maillist_core

#### Table of Contents

1. [Description](#description)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

<a id="description"></a>
## Description

The maillist module is used to manage email lists. This module requires `mailman` to be available on the agent system in order to run successfully.

### Beginning with maillist_core
To manage a mail list, add the maillist type to a class:
```
maillist { 'craft_circle':
  ensure => present,
  admin => 'leader@crafting.com',
  password => 'uber secret',
  description => 'A mail list for crafting',
  mailserver => '172.12.0.123',
  webserver => '173.23.0.82',
}
```
This example will create a new mail list called craft_circle.

<a id="usage"></a>
## Usage

The mailalias module is used to manage entries in `/etc/aliases`, which creates an email alias in the local alias database.

<a id="reference"></a>
## Reference

Please see REFERENCE.md for the reference documentation.

This module is documented using Puppet Strings.

For a quick primer on how Strings works, please see [this blog post](https://puppet.com/blog/using-puppet-strings-generate-great-documentation-puppet-modules) or the [README.md](https://github.com/puppetlabs/puppet-strings/blob/master/README.md) for Puppet Strings.

To generate documentation locally, run
```
bundle install
bundle exec puppet strings generate ./lib/**/*.rb
```
This command will create a browsable `\_index.html` file in the `doc` directory. The references available here are all generated from YARD-style comments embedded in the code base. When any development happens on this module, the impacted documentation should also be updated.

<a id="limitations"></a>
## Limitations

This module is only supported on platforms that have `mailman` available.

<a id="development"></a>
## Development
Puppet Labs modules on the Puppet Forge are open projects, and community contributions are essential for keeping them great. We can't access the huge number of platforms and myriad of hardware, software, and deployment configurations that Puppet is intended to serve.

We want to keep it as easy as possible to contribute changes so that our modules work in your environment. There are a few guidelines that we need contributors to follow so that we can have a chance of keeping on top of things.

For more information, see our [module contribution guide.](https://docs.puppetlabs.com/forge/contributing.html)
