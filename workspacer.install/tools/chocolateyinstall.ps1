﻿$ErrorActionPreference = "Stop";

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileType     = 'MSI'
  file64       = "$toolsDir\workspacer-$env:chocolateyPackageVersion-stable.msi"
  silentArgs   = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyInstallPackage @packageArgs
