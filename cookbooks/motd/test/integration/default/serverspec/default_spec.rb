require 'serverspec'
set :backend, :exec

describe 'motd' do
  describe file('/etc/motd') do
    it { should be_file }
    it { should contain('Chef') }
  end
end
