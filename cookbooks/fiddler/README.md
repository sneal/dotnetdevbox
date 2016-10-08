[![Cookbook Version](http://img.shields.io/cookbook/v/fiddler.svg)](https://supermarket.chef.io/cookbooks/fiddler)
[![Build status](https://ci.appveyor.com/api/projects/status/ppw4kvtacxv62n8d/branch/master?svg=true)](https://ci.appveyor.com/project/ChefWindowsCookbooks65871/fiddler/branch/master)

# Fiddler cookbook

Installs Fiddler

# Requirements

## Platform

* Windows 7
* Windows Server 2008
* Windows Server 2008 R2
* Windows Server 2012
* Windows Server 2012 R2

## .NET 4

Fiddler requires the .NET framework 4 (4.0, 4.5.x, or 4.6.x) which can be installed via another cookbook of your choosing.

# Usage

Include `fiddler::default` in your node's run list.

# Attributes

## Optional

* `node['fiddler']['url']` - The full download URL to the installer executable, defaults to http://www.telerik.com/docs/default-source/fiddler/fiddler4setup.exe?sfvrsn=2.
* `node['fiddler']['checksum']` - The SHA256 of the installer executable file.

## Recipes

### default

Installs Fiddler4

## Author

Author:: Shawn Neal (sneal@sneal.net)
