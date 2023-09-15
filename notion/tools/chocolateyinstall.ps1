$ErrorActionPreference = 'Stop';

$url64      = 'https://desktop-release.notion-static.com/Notion%20Setup%202.2.0.exe'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = $url64
  softwareName   = 'notion*'
  checksum64     = '6d1156dc387f36a878ebf177e40340f3040d4384fb29fe4bc7df88a4da018ed1'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
