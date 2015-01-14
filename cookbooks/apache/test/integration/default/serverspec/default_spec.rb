require 'serverspec'
set :backend, :exec

describe 'apache' do
  it "is installed" do
    expect(package("httpd")).to be_installed
  end
end
