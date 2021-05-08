$ErrorActionPreference = "Stop";

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileFullPath64 = "$toolsDir\workspacer-stable-$env:chocolateyPackageVersion.zip"
  destination    = $toolsDir
}

Get-ChocolateyUnzip @packageArgs

# Only shim workspacer.exe
$files = Get-Childitem $toolsDir -include *.exe -exclude workspacer.exe -recurse
foreach ($file in $files) {
  New-Item "$file.ignore" -type file -force
}

# Don't need installer zip anymore
rm $toolsDir\*.zip -ea 0 -force
