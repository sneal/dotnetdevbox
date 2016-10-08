[![Cookbook Version](http://img.shields.io/cookbook/v/notepadpp.svg)](https://supermarket.chef.io/cookbooks/notepadpp)
[![Build status](https://ci.appveyor.com/api/projects/status/193b2595cyufx8ym/branch/master?svg=true)](https://ci.appveyor.com/project/ChefWindowsCookbooks65871/notepadpp/branch/master)

# Notepad++ Cookbook

Installs [Notepad++](https://notepad-plus-plus.org) 

## Supported Platforms
- Windows 7
- Windows 8
- Windows 8.1
- Windows 10
- Windows Server 2008
- Windows Server 2008 R2
- Windows Server 2012
- Windows Server 2012 R2

# Attributes

## Optional
* `node['notepadpp']['version']` - Version of Notepad++ to install, defaults to 7.0.

# Usage

## default

Add `notepadpp::default` to your runlist.

# Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. add-something-awesome)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the build and ensure it passes. `bundle install && bundle exec rake && kitchen verify`
6. Submit a Pull Request