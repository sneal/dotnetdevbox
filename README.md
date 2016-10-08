# .NET Development Box

This Vagrantfile config creates and installs a fresh .NET development environment.

## Requirements

1. Vagrant 1.8.6+
2. ChefDK 16.28+

## Usage

```
$ berks vendor ./cookbooks
$ vagrant up
```

## Adding Chef cookbooks

If you'd like to add a new Chef cookbook to execute, you must do the following:

1. Add the cookbook to the runlist in the Vagrantfile
2. Add the cookbook to the Berksfile as a dependency.
3. Re-run Berkshelf to vendor the new dependency.
