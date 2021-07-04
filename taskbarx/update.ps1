Import-Module au

$releases = "https://github.com/ChrisAnd1998/TaskbarX/releases/latest"

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`${1}$($Latest.ReleaseNotes)`$2"
        }

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
    $request = [System.Net.WebRequest]::Create($releases)
    $request.AllowAutoRedirect = $false
    $response = $request.GetResponse()
    $downloadUrl = $response.GetResponseHeader("Location")
    
    $version = $downloadUrl -Split '/' | Select-Object -Last 1

    @{
        URL32   = "https://github.com/ChrisAnd1998/TaskbarX/releases/download/$version/TaskbarX_1.7.0.0_x86.zip"
        URL64   = "https://github.com/ChrisAnd1998/TaskbarX/releases/download/$version/TaskbarX_1.7.0.0_x64.zip"
        Version = $version.Replace('v','')
        ReleaseNotes = "https://github.com/ChrisAnd1998/TaskbarX/releases/tag/$version"
    }
}

update -ChecksumFor None 
