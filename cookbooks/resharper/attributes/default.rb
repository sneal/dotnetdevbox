#
# Author:: Shawn Neal (<sneal@sneal.net>)
# Cookbook Name:: resharper
# Attribute:: default
#
# Copyright 2013, Daptiv Solutions, LLC.
# Copyright 2016, Shawn Neal
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

default['resharper']['version'] = '2016.2.2'
default['resharper']['source'] = 'https://download.jetbrains.com/resharper/'
default['resharper']['vs_versions'] = %w(10 11 12 14)
default['resharper']['products'] = 'dotPeek;ReSharper'
default['resharper']['checksum'] = 'eccad508fb83428f8c5a3a9a4fc9d930251f101f4929845fc4aea3ab004169dd'
default['resharper']['install_dir'] =
  ::File.join(ENV['ProgramFiles(x86)'] || 'C:\Program Files (x86)', 'JetBrains')
