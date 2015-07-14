require 'serverspec'

# Required by serverspec
set :backend, :cmd
set :os, :family => 'windows'

describe package("Quest PowerGUI*") do
  it { should be_installed }
end
