
param(
     [string] $hostPoolName =$(throw "hostPoolName is required.")#= "wvd-arm-dist-hp1",
    ,[string] $resourcegroupname =$(throw "resourcegroupname is required.")#= "wvd-arm-cross-subs"
)
foreach($sh in $(current_hp_vm)){
    Write-Output $sh
    #Update-AzWvdSessionHost -ResourceGroupName $resourcegroupname -HostPoolName $hostPoolName -Name $sh -AllowNewSession:$true
}