$ErrorActionPreference = 'Stop';

$url64      = 'https://desktop-release.notion-static.com/Notion%20Setup%202.0.49.exe'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = $url64
  softwareName   = 'notion*'
  checksum64     = '62bc3466f91712493a8446d216b02ff3cfb1195522c1dbd3434971cb706e7d24'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
