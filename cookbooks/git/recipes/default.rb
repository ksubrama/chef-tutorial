#
# Cookbook Name:: git
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
package 'git' do
  action :install
end

file '/home/chef/.gitconfig' do
  content "[user]\n  name=Kartik Cating-Subramanian\n  email=ksubramanian@chef.io\n"
  user 'chef'
  group 'chef'
end
