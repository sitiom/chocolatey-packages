import-module au

$releases = "https://github.com/rickbutton/workspacer/releases/latest"

function global:au_SearchReplace {
    @{
        ".\legal\VERIFICATION.txt" = @{
            "(?i)(\s+x64:).*"                   = "`${1} $($Latest.URL64)"
            "(?i)(Get-RemoteChecksum).*"        = "`${1} $($Latest.URL64)"
            "(?i)(\s+checksum64:).*"            = "`${1} $($Latest.Checksum64)"
          }
    }
}

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix }

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $regex = "workspacer-stable-.+\.zip$"
    $url = "https://github.com$(($download_page.links | ? href -match $regex).href)"
    $version = $url -split '/' | select -Last 1 -Skip 1

    @{
        URL64 = $url
        Version = $version.Replace('v','')
    }
}

update -ChecksumFor None
