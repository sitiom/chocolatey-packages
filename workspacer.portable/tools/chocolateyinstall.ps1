$ErrorActionPreference = "Stop";

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileFullPath64 = "$toolsDir\workspacer-stable-$env:chocolateyPackageVersion.zip"
  destination    = $toolsDir
}

Get-ChocolateyUnzip @packageArgs

# Do not shim exes
$files = Get-Childitem $toolsDir -include *.exe -recurse
foreach ($file in $files) {
  New-Item "$file.ignore" -type file -force
}

# Add workspacer shortcut
$startMenuPath = [Environment]::GetFolderPath("CommonPrograms")
Install-ChocolateyShortcut `
  -ShortcutFilePath "$startMenuPath\workspacer\workspacer.lnk" `
  -TargetPath "$toolsDir\workspacer.exe"

# Don't need installer zip anymore
Remove-Item $toolsDir\*.zip -ea 0 -force
