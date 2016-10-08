#
# Cookbook Name:: resharper
# Recipe:: default
#
# Copyright (C) 2013 Daptiv Solutions LLC
# Copyright (C) 2016 Shawn Neal
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

version = node['resharper']['version']
local_setup = ::File.join(Chef::Config[:file_cache_path], "JetBrains.ReSharperUltimate.#{version}.exe")

remote_file "download_resharper_#{version}" do
  path local_setup
  checksum node['resharper']['checksum']
  source ::File.join(node['resharper']['source'], "JetBrains.ReSharperUltimate.#{version}.exe")
  notifies :run, "execute[install_resharper_#{version}]", :immediately
end

log_file = win_friendly_path(::File.join(Dir.tmpdir, "resharper#{version}.log"))
opts = "/VsVersion=#{node['resharper']['vs_versions'].join(';')} " \
  "/SpecificProductNames=#{node['resharper']['products']} " \
  "/IgnoreExtensions=True /Silent=True /PerMachine=True /LogFile=#{log_file}"

execute "install_resharper_#{version}" do
  command "#{local_setup} #{opts}"
  action :nothing
end
