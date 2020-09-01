
param(
     [string] $hostPoolName =$(throw "hostPoolName is required.")#= "wvd-arm-dist-hp1",
    ,[string] $resourcegroupname =$(throw "resourcegroupname is required.")#= "wvd-arm-cross-subs"
    ,$current_hp_vm =$(throw "vm array is required.")
)

$_currenthpvm=$current_hp_vm
Write-Output $_currenthpvm.Count
foreach($sh in $_currenthpvm){
    Write-Output $sh
    #Update-AzWvdSessionHost -ResourceGroupName $resourcegroupname -HostPoolName $hostPoolName -Name $sh -AllowNewSession:$true
}