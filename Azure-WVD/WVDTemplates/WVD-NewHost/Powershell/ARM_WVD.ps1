Install-Module -Name Microsoft.RDInfra.RDPowerShell
Import-Module -Name Microsoft.RDInfra.RDPowerShell


#https://docs.microsoft.com/en-us/powershell/module/az.desktopvirtualization/update-azwvdsessionhost?view=azps-4.6.1

Install-Module -Name Az.DesktopVirtualization

Connect-AzAccount
Get-AzSubscription | Out-GridView -PassThru | Select-AzSubscription

 Get-AzWvdHostPool -Name wvd-arm-dist-hp1 -ResourceGroupName wvd-arm-cross-subs
Get-AzWvdSessionHost -HostPoolName wvd-arm-dist-hp1 -Name wvd-arm-dist-hp.wvdarm.com -ResourceGroupName wvd-arm-cross-subs

Get-AzWvdUserSession -ResourceGroupName wvd-arm-cross-subs -HostPoolName wvd-arm-dist-hp1 -SessionHostName wvd-arm-dist-hp.wvdarm.com

Get-AzWvdUserSession -ResourceGroupName wvd-arm-cross-subs -HostPoolName wvd-arm-dist-hp1 
Update-AzWvdSessionHost -ResourceGroupName wvd-arm-cross-subs -HostPoolName wvd-arm-dist-hp1 -Name wvd-arm-dist-hp.wvdarm.com -AllowNewSession:$true