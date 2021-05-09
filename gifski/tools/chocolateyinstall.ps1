$ErrorActionPreference = "Stop";

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  fileFullPath64 = "$toolsDir\gifski-$env:chocolateyPackageVersion.tar.xz"
  destination    = $toolsDir
}
Get-ChocolateyUnzip @packageArgs 

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileFullPath64 = "$toolsDir\gifski-$env:chocolateyPackageVersion.tar"
  destination    = $toolsDir
  specificFolder = "win"
}
Get-ChocolateyUnzip @packageArgs 

# Don't need tar file anymore
Remove-Item $toolsDir\*.tar.xz, $toolsDir\*.tar -ea 0 -force
