$hostPoolName="wvd-arm-dist-hp1"
$resourcegroupname="wvd-arm-cross-subs"


foreach($sh in $current_sh_vm){
    Write-Output $sh
    #Update-AzWvdSessionHost -ResourceGroupName $resourcegroupname -HostPoolName $hostPoolName -Name $sh -AllowNewSession:$true
}