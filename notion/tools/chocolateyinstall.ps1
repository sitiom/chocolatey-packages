$ErrorActionPreference = 'Stop';

$url64      = 'https://desktop-release.notion-static.com/Notion%20Setup%202.2.4.exe'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = $url64
  softwareName   = 'notion*'
  checksum64     = 'ba18604307593e8bfa4f90d1bc6cee56f3434e41f8d5a3edfc998277bd5ee18d'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
