$ErrorActionPreference = "Stop";

$startMenuPath = [Environment]::GetFolderPath("CommonPrograms")

Remove-Item "$startMenuPath\dnSpy.lnk" -Force -ea 0
