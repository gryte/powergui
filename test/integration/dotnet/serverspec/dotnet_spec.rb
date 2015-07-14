require 'serverspec'

# Required by serverspec
set :backend, :cmd
set :os, :family => 'windows'

describe windows_feature('NetFx3') do
  it { should be_installed.by('dism') }
end

describe windows_feature('Net-Framework-Core') do
  it { should be_installed.by('powershell') }
end
