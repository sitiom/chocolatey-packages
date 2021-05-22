$ErrorActionPreference = "Stop";

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileFullPath64 = "$toolsDir\pipes-rs-windows-x86_64.zip"
  destination    = $toolsDir
}
Get-ChocolateyUnzip @packageArgs 

# Don't need zip anymore
Remove-Item $toolsDir\*.zip, $toolsDir\*.zip -ea 0 -force
