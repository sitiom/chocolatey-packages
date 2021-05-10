$ErrorActionPreference = "Stop";

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileFullPath   = Get-Item $toolsDir\*_x86.zip
  fileFullPath64 = Get-Item $toolsDir\*_x64.zip
  destination    = $toolsDir
}

Get-ChocolateyUnzip @packageArgs
Remove-Item $toolsDir\*.zip -ea 0 -force

$files = Get-Childitem $toolsDir -include *.exe -recurse
$startMenuPath = [Environment]::GetFolderPath("CommonPrograms")
# Do not shim exes and add a shortcut for each
foreach ($file in $files) {
  New-Item "$file.ignore" -type file -force
  Install-ChocolateyShortcut `
    -ShortcutFilePath "$startMenuPath\TaskbarX\$($file.BaseName).lnk" `
    -TargetPath $file
}