#
# Cookbook Name:: apache
# Recipe:: fw_disable
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
package 'iptables' do
  action :install
end

service 'iptables' do
  action [ :disable, :stop ]
end
