$ErrorActionPreference = 'Stop';

$url64      = 'https://desktop-release.notion-static.com/Notion%20Setup%202.0.16.exe'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = $url64
  softwareName   = 'notion*'
  checksum64     = '26825c3b8de2138dd3d04528de37c2b105c597a86c0d597a40fb31897789b96a'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
