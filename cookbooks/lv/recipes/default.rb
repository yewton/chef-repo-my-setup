#
# Cookbook Name:: tmux
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
package "compat-libtermcap" do
  action :install
end

filename = "lv-4.51-8.1.x86_64.rpm"
file_checksum = "cc0e22f9e9433820155a48e3c6356843c7de8b3b86b7760ea3fd69ce450fc0ec"

cookbook_file "/tmp/#{filename}" do
  source "#{filename}"
  checksum #{file_checksum}
end

package "lv" do
  action :install
  provider Chef::Provider::Package::Rpm
  source "/tmp/#{filename}"
end
