# Requires -RunAsAdministrator
# Supports provisioning inside and outside Vagrant
#

# Support PowerShell < v3 which doesn't have $PSScriptRoot defined
if (!$PSScriptRoot) { $PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path -Parent }

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

# Configure explorer to show file extensions and hidden files
reg ADD 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\' /v HideFileExt /t REG_DWORD /d 0 /f
reg ADD 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\' /v Hidden /t REG_DWORD /d 1 /f

# Install Chef Client
if (!(Test-Path 'C:/opscode/chef/bin/chef-solo.bat')) {
  Write-Host 'Downloading Chef'
  (New-Object System.Net.WebClient).DownloadFile('http://www.getchef.com/chef/install.msi', 'C:\Windows\Temp\chef.msi')
  Write-Host 'Started installing Chef'
  Start-Process C:/Windows/System32/msiexec.exe -ArgumentList "/qn /i C:\Windows\Temp\chef.msi" -Wait
  Start-Sleep 2
  Write-Host 'Finished installing Chef'
}

# Create the Chef config file
$solorb = @"
cookbook_path ['$PSScriptRoot/cookbooks']
node_path 'c:/chef/node'
file_cache_path 'c:/chef/cache'
file_backup_path 'c:/chef/backup'
checksum_path 'c:/chef/checksum'
local_mode true
chef_zero.enabled true
verbose_logging true
"@
echo "$solorb" | Out-File -FilePath "$env:TEMP/solo.rb" -Encoding UTF8

# Execute Chef run in local mode
C:/opscode/chef/bin/chef-solo.bat -c "$env:TEMP/solo.rb" -j "$PSScriptRoot/solo.json" -l info
