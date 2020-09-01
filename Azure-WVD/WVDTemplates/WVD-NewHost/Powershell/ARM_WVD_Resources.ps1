#https://docs.microsoft.com/en-us/powershell/module/az.desktopvirtualization/update-azwvdsessionhost?view=azps-4.6.1

#Install-Module -Name Az.DesktopVirtualization

#Connect-AzAccount
#Get-AzSubscription | Out-GridView -PassThru | Select-AzSubscription

$hostPoolName="wvd-arm-dist-hp1"
$resourcegroupname="wvd-arm-cross-subs"
$FQDN="wvdarm.com"

$hostPool=Get-AzWvdHostPool -Name $hostPoolName -ResourceGroupName $resourcegroupname
$SessionHost=Get-AzWvdSessionHost -HostPoolName $hostPool.Name -ResourceGroupName $resourcegroupname

foreach($sh in $SessionHost){
    $splitValues = $sh.Name.Split("/")
   
   [int]$splitCount= $splitValues.count
    $lastrecordIndex=$splitCount-1
    
    Write-Output $sh.Name.Split("/")[$lastrecordIndex].Replace($FQDN,"")

}



<#Get-AzWvdSessionHost -HostPoolName wvd-arm-dist-hp1 -Name wvd-arm-dist-hp.wvdarm.com -ResourceGroupName wvd-arm-cross-subs

Get-AzWvdUserSession -ResourceGroupName wvd-arm-cross-subs -HostPoolName wvd-arm-dist-hp1 -SessionHostName wvd-arm-dist-hp.wvdarm.com

Get-AzWvdUserSession -ResourceGroupName wvd-arm-cross-subs -HostPoolName wvd-arm-dist-hp1 
#Update-AzWvdSessionHost -ResourceGroupName wvd-arm-cross-subs -HostPoolName wvd-arm-dist-hp1 -Name wvd-arm-dist-hp.wvdarm.com -AllowNewSession:$true
#>