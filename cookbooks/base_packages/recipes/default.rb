#
# Cookbook Name:: base_packages
# Recipe:: default
#
# Copyright 2013, yewton
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
%w[libevent].each do |package_name|
  package package_name do
    action :install
  end
end

filename = "tmux-1.6-1.el6.rf.x86_64.rpm"
file_checksum = "314d691a21b67b41d0244c4eced2788542aa8b1267893f58cfe9981e00614d9d"

cookbook_file "/tmp/#{filename}" do
  source "#{filename}"
  checksum #{file_checksum}
end

package "tmux" do
  action :install
  provider Chef::Provider::Package::Rpm
  source "/tmp/#{filename}"
end
