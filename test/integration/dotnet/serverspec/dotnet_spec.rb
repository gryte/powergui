require 'serverspec'
# require 'chef/win32/version'

# Required by serverspec
set :backend, :cmd
set :os, family: 'windows'

describe windows_feature('NetFx3') do
  it { should be_installed.by('dism') }
end
