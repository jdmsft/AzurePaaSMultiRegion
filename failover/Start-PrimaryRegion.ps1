$RGName = 'TST-HAAPP-1'
$PrimaryWebApp = 'jdhaappprimary'
$PrimarySqlServer = 'jdhaapp-sqlsrv-primary' 
$SqlFailoverGroupName = 'jdhaapp'

Write-Host "Starting Azure Primary Region ..."
Start-AzWebApp -ResourceGroupName $RGName -Name $PrimaryWebApp | Out-Null
Write-Host "Triggering Traffic Manager failover to Primary Region..."
Write-Host "Triggering SQL Database failover to Primary Region..."
Switch-AzSqlDatabaseFailoverGroup -ResourceGroupName $RGName -ServerName $PrimarySqlServer -FailoverGroupName $SqlFailoverGroupName