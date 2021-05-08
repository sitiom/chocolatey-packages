$packageName = $env:ChocolateyPackageName

$p = Get-Process -Name workspacer, workspacer.Watcher -ea 0
if (!$p) {
    Write-Host "$packageName is not running."
    return
}

Write-Host "$packageName is running, trying to gracefully shut it down before upgrade/uninstall..."
Stop-Process -InputObject $p -Force

