# .NET Development Box

Vagrantfile and supporting recipes to create a Windows 2012R2 Server .NET 4.6.1 development environment.

## Installed Apps

- VisualStudio 2015 Community Edition
- ReSharper Utlimate 2016
- Windows Git
- Notepad++
- BeyondCompare 4
- Google Chrome
- 7-Zip

## Requirements

1. Vagrant 1.8.6+
2. VirtualBox 5.1+

## Usage

```
$ git clone https://github.com/sneal/dotnetdevbox.git
$ cd dotnetdevbox
$ vagrant up
```

Up'ing the box will take a while (usually 20 to 60 minutes) depending on your internet connection speed. The base Windows Server box and the VisualStudio ISO are several gigabytes.

## Adding/Updating Chef Cookbooks

If you'd like to add a new Chef cookbook to execute, you must do the following:

1. Add the cookbook to the runlist in the Vagrantfile
2. Add the cookbook to the Berksfile as a dependency.
3. Re-run Berkshelf `berks vendor ./cookbooks` to vendor the new dependency and commit the cookbook to this repo. To vendor cookbooks you need the [ChefDK](https://downloads.chef.io/chef-dk/) installed.
