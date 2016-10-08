#
# Author:: Shawn Neal (<sneal@sneal.net>)
# Cookbook Name:: fiddler
# Attribute:: default
#
# Copyright:: Copyright (c) 2014 Daptiv Solutions LLC.
# Copyright:: Copyright (c) 2016 Shawn Neal
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['fiddler']['url'] = 'http://www.telerik.com/docs/default-source/fiddler/fiddler4setup.exe?sfvrsn=2'
default['fiddler']['checksum'] = '62d2c12e9fef10ab36b4e08590153b71d4263c418bb57e42f4ebfc0463d83145'
default['fiddler']['install_dir'] = (ENV['ProgramFiles(x86)'] || 'C:\Program Files (x86)') + '\Fiddler2'
