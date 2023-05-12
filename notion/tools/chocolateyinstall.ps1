$ErrorActionPreference = 'Stop';

$url64      = 'https://desktop-release.notion-static.com/Notion%20Setup%202.0.44.exe'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = $url64
  softwareName   = 'notion*'
  checksum64     = '932f01b217f2f279b3db699be11ce50ce15505ecfc35e9e3e5d37afef76452cd'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
