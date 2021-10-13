param([string]$Uri = 'http://jdhaapp.trafficmanager.net/api/order', [switch]$Loop)
If ($Loop)
{
    For (;;)
    {
        Try 
        { 
            $request = iwr -Method GET -Uri $Uri -SkipCertificateCheck
            $StatusCode = $request.StatusCode
            $WebLocation = $request.Headers.'Web-Region-Name'
            $DBLocation = $request.Headers.'DB-Server-Name'
            Write-Output "[$StatusCode] Web : $WebLocation | Database : $DBLocation" 
        
        } Catch { Write-Output "UNAVAILABLE"}

        Start-Sleep -Seconds 1
    }
}
Else 
{
    $request = iwr -Method GET -Uri $Uri
    $StatusCode = $request.StatusCode
    $WebLocation = $request.Headers.'Web-Region-Name'
    $DBLocation = $request.Headers.'DB-Server-Name'
    Write-Output "[$StatusCode] Web : $WebLocation | Database : $DBLocation"
}
