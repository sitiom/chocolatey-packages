import-module au

$releases = "https://github.com/workspacer/workspacer/releases/latest"

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
    $request = [System.Net.WebRequest]::Create($releases)
    $request.AllowAutoRedirect = $false
    $response = $request.GetResponse()
    $downloadUrl = $response.GetResponseHeader("Location")
    
    $version = $downloadUrl -Split '/' | Select-Object -Last 1

    @{
        URL64   = "https://github.com/workspacer/workspacer/releases/download/$version/workspacer-$($version.Replace('v',''))-stable.msi"
        Version = $version.Replace('v','')
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}
