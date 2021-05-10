$ErrorActionPreference = "Stop";

$startMenuPath = [Environment]::GetFolderPath("CommonPrograms")

Remove-Item "$startMenuPath\TaskbarX" -recurse -force -ea 0