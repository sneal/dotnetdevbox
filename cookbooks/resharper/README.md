[![Cookbook Version](http://img.shields.io/cookbook/v/resharper.svg)](https://supermarket.chef.io/cookbooks/resharper)
[![Build status](https://ci.appveyor.com/api/projects/status/j2fei3q90p9dft9q/branch/master?svg=true)](https://ci.appveyor.com/project/ChefWindowsCookbooks65871/resharper/branch/master)

# ReSharper Cookbook

Installs and configures JetBrains ReSharper Ultimate 2016+.

# Requirements

Visual Studio is already installed.

# Usage

Include the `resharper::default` recipe in your run list.

# Attributes

## Optional

* `node['resharper']['version']` - Defaults to ReSharper `2016.2.2`. If you change this you'll need to change the installer checksum.
* `node['resharper']['checksum']` - The setup executable SHA256 checksum.
* `node['resharper']['source']` - Root URL to download the setup executable, defaults to `https://download.jetbrains.com/resharper/`
* `node['resharper']['vs_versions']` - The VS major versions to integrate ReSharper into. Defaults to `%w(10 11 12 14)` where 14 is Visual Studio 2015 and so on.
* `node['resharper']['products']` - The JetBrains products to install. Defaults to `dotPeek;ReSharper`. Product names must be separated by semi-colons 

See [this JetBrains article](https://resharper-support.jetbrains.com/hc/en-us/articles/207241485-How-can-I-perform-a-silent-install-of-ReSharper-) for all `vs_versions` and `products` options.

# Recipes

default
-------
Installs ReSharper

# Author

Author:: Shawn Neal (<sneal@sneal.net>)
