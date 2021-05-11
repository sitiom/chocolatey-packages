$ErrorActionPreference = "Stop";

$startMenuPath = [Environment]::GetFolderPath("CommonPrograms")

Remove-Item "$startMenuPath\workspacer" -recurse -force -ea 0
