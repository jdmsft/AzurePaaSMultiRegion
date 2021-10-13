$RGName = 'TST-HAAPP-1'
$PrimaryWebApp = 'jdhaappprimary'
$SecondarySqlServer = 'jdhaapp-sqlsrv-secondary' 
$SqlFailoverGroupName = 'jdhaapp'

Write-Host "Stopping Azure Primary Region ..."
Stop-AzWebApp -ResourceGroupName $RGName -Name $PrimaryWebApp | Out-Null

Write-Host "Traffic Manager primary endpoint (Primary Region) down  ..."
Write-Host "Triggering Traffic Manager failover to West Europe ..."
Write-Host "Triggering SQL Database failover to West Europe ..."
Switch-AzSqlDatabaseFailoverGroup -ResourceGroupName $RGName -ServerName $SecondarySqlServer -FailoverGroupName $SqlFailoverGroupName