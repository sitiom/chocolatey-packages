﻿$ErrorActionPreference = "Stop";

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

# Extract twice because of nested zips
$packageArgs = @{
  fileFullPath   = Get-Item $toolsDir\*-win32.zip
  fileFullPath64 = Get-Item $toolsDir\*-win64.zip
  destination    = "$toolsDir\temp"
}
Get-ChocolateyUnzip @packageArgs
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileFullPath   = Get-Item $toolsDir\temp\*-win32.zip
  fileFullPath64 = Get-Item $toolsDir\temp\*-win64.zip
  destination    = $toolsDir
}
Get-ChocolateyUnzip @packageArgs

# Zip not needed anymore
Remove-Item $toolsDir\temp -Recurse -Force -ea 0 
Remove-Item $toolsDir\*.zip -Force -ea 0 

$file = Get-Childitem $toolsDir -Include dnSpy.exe -Recurse
$startMenuPath = [Environment]::GetFolderPath("CommonPrograms")
# Do not shim dnSpy GUI and add a shortcut for it
New-Item "$file.ignore" -Type file -Force
Install-ChocolateyShortcut `
  -ShortcutFilePath "$startMenuPath\$($file.BaseName).lnk" `
  -TargetPath $file
