case node['platform']
when 'windows'

  require 'chef/win32/version'

  windows_version = Chef::ReservedNames::Win32::Version.new

  # Use windows cookbook to manage feature on Windows 2008r2 or Windows 7
  if windows_version.windows_server_2008_r2? || windows_version.windows_7?
    windows_feature 'NetFx3' do
      action :install
    end
  end

  # Use powershell resource to manage feature on Windows 2012r2
  if windows_version.windows_server_2012_r2?
    powershell_script 'dotNet35' do
      code 'Install-WindowsFeature -name Net-Framework-Core'
      guard_interpreter :powershell_script
      not_if '(Get-WindowsFeature -Name Net-Framework-Core).Installed'
    end
  end
end
