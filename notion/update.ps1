Import-Module au

$download = 'https://www.notion.so/desktop/windows/download'

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(^[$]url64\s*=\s*)('.*')"          = "`$1'$($Latest.URL64)'"
      "(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
    }
  }
}

function global:au_GetLatest {
    $request = [System.Net.WebRequest]::Create($download)
    $request.AllowAutoRedirect = $false
    $response = $request.GetResponse()
    $downloadUrl = $response.GetResponseHeader("Location")

    $setupName = [System.Net.WebUtility]::UrlDecode($downloadUrl) -split '/' | Select-Object -Last 1
    if (!($setupName -match "\d+(\.\d+)+")) {
        Write-Error "Cannot find version from download link."
    }
    $version = $matches[0]

    @{
        URL64   = $downloadUrl
        Version = $version
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
  Update-Package -ChecksumFor 64
}
