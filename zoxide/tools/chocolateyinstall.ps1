$ErrorActionPreference = "Stop";

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileFullPath64 = "$toolsDir\zoxide-x86_64-pc-windows-msvc.zip"
  destination    = $toolsDir
}
Get-ChocolateyUnzip @packageArgs 

# Don't need zip anymore
Remove-Item $toolsDir\*.zip, $toolsDir\*.zip -ea 0 -force
