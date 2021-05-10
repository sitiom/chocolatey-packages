Import-Module au

$releases = "https://github.com/ChrisAnd1998/TaskbarX/releases/latest"

function global:au_SearchReplace {
    @{
        ".\legal\VERIFICATION.txt" = @{
            "(?i)(\s+x32:).*"            = "`${1} $($Latest.URL32)"
            "(?i)(\s+x64:).*"            = "`${1} $($Latest.URL64)"
            "(?i)(Get-RemoteChecksum).*" = "`${1} $($Latest.URL64)"
            "(?i)(\s+checksum32:).*"     = "`${1} $($Latest.Checksum32)"
            "(?i)(\s+checksum64:).*"     = "`${1} $($Latest.Checksum64)"
        }
    }
}

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix }

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $regex = "(x64|x86)\.zip$"
    $url = $download_page.links | Where-Object href -match $regex | Select-Object -First 2 -expand href | ForEach-Object { "https://github.com$($_)" }
    $version = $url -split '/' | Select-Object -Last 1 -Skip 1

    @{
        URL32 = $url[1]
        URL64 = $url[0]
        Version = $version
        ReleaseNotes = "https://github.com/ChrisAnd1998/TaskbarX/releases/tag/${version}"
    }
}

update -ChecksumFor None
