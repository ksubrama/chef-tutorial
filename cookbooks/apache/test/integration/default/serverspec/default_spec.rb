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
    it { should be_listening.with('tcp') }
  end

  describe file('/var/www/html/index.html') do
    it { should be_file}
    it { should contain('Hello') }
  end

  describe command('curl http://localhost/') do
    its(:exit_status) { should eq 0 }
    its(:stdout) { should match /Hello/ }
  end

  describe service('iptables') do
    it { should be_stopped }
    it { should be_disabled }
  end
end
