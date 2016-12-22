# Requires -RunAsAdministrator
# Supports provisioning inside and outside Vagrant
#

# Returns true if the current session is running under an Administrator
function Test-Admin {
  $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
  $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

# Ensure the user is running from a session without UAC getting in our way
if ((Test-Admin) -eq $false) {
  Write-Error 'This script must be run from a PowerShell session with Administrator privileges'
  exit 1
}

# Install Chef Client
if (!(Test-Path 'C:/opscode/chef/bin/chef-solo.bat')) {
  Write-Host 'Downloading Chef'
  (New-Object System.Net.WebClient).DownloadFile('http://www.getchef.com/chef/install.msi', 'C:\Windows\Temp\chef.msi')
  Write-Host 'Started installing Chef'
  Start-Process C:/Windows/System32/msiexec.exe -ArgumentList "/qn /i C:\Windows\Temp\chef.msi" -Wait
  Start-Sleep 2
  Write-Host 'Finished installing Chef'
}

# Create a Chef config file
echo "cookbook_path ['$PSScriptRoot\cookbooks']" | Out-File -FilePath "$env:TEMP/solo.rb" -Encoding UTF8
echo 'local_mode true' | Out-File -FilePath "$env:TEMP/solo.rb" -Encoding UTF8 -Append
echo 'chef_zero.enabled true' | Out-File -FilePath "$env:TEMP/solo.rb" -Encoding UTF8 -Append
echo 'verbose_logging true' | Out-File -FilePath "$env:TEMP/solo.rb" -Encoding UTF8 -Append

# Execute Chef run in local mode
C:/opscode/chef/bin/chef-solo.bat -c "$env:TEMP/solo.rb" -j "$PSScriptRoot/solo.json" -l info
