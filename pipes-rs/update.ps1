Import-Module au

$releases = "https://github.com/lhvy/pipes-rs/releases/latest"

function global:au_SearchReplace {
    @{
        ".\legal\VERIFICATION.txt" = @{
            "(?i)(\s+x64:).*"            = "`${1} $($Latest.URL64)"
            "(?i)(Get-RemoteChecksum).*" = "`${1} $($Latest.URL64)"
            "(?i)(\s+checksum64:).*"     = "`${1} $($Latest.Checksum64)"
        }
    }
}

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix }

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    
    $downloadUrl = ( $download_page.BaseResponse.ResponseUri.AbsoluteUri,
        $download_page.BaseResponse.RequestMessage.RequestUri.AbsoluteUri)[$null -eq $download_page.BaseResponse.ResponseUri]
    $version = $downloadUrl -split '/' | Select-Object -Last 1

    $url = "https://github.com/lhvy/pipes-rs/releases/download/$version/pipes-rs-windows-x86_64.zip"

    @{
        URL64   = $url
        Version = $version.Replace('v','')
    }
}

update -ChecksumFor None
