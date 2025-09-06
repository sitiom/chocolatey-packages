$ErrorActionPreference = "Stop";
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage `
    -PackageName $env:ChocolateyPackageName `
    -Url "https://github.com/dnSpyEx/dnSpy/releases/latest/download/dnSpy-net-win32.zip" `
    -Url64bit "https://github.com/dnSpyEx/dnSpy/releases/latest/download/dnSpy-net-win64.zip" `
    -UnzipLocation $toolsDir

$target = Get-ChildItem $toolsDir -Include "dnSpy.exe" -Recurse | Select-Object -First 1
$shortcutDir = @{$true="CommonPrograms";$false="Programs"}[($PSVersionTable.PSVersion -gt "2.0.0.0")]
$shortcut = Join-Path ([System.Environment]::GetFolderPath($shortcutDir)) "dnSpy.lnk"

New-Item "$target.FullName.ignore" -Type File -Force
Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $target
