require 'serverspec'
set :backend, :exec

describe 'apache' do
  describe package('httpd') do
    it { should be_installed }
  end

  describe service('httpd') do
    it { should be_running }
    it { should be_enabled }
  end

  describe port(80) do
    it { should be_listening.on('127.0.0.1').with('tcp') }
  end

  describe command('curl http://localhost/') do
    its(:exit_status) { should eq 0 }
    its(:stdout) { should match /hello/ }
  end 
end
