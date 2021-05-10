Import-Module au

$releases = "https://github.com/ImageOptim/gifski/releases/latest"

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

    $regex = "gifski-.+\.tar.xz$"
    $url = "https://github.com$(($download_page.links | Where-Object href -match $regex).href)"
    $version = $url -split '/' | Select-Object -Last 1 -Skip 1

    @{
        URL64   = $url
        Version = $version
        ReleaseNotes = "https://github.com/ImageOptim/gifski/releases/tag/${version}"
    }
}

update -ChecksumFor None
