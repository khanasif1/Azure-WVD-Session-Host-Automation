
param(
     [string] $hostPoolName =$(throw "hostPoolName is required.")#= "wvd-arm-dist-hp1",
    ,[string] $resourcegroupname =$(throw "resourcegroupname is required.")#= "wvd-arm-cross-subs"
    ,[System.Object[]] $hp_vm =$(throw "vm array is required.")
)
Write-Output "*********Start Drain Script*********"
Write-Output $hp_vm
$_currenthpvm=$hp_vm | ConvertFrom-Json
Write-Output $_currenthpvm.Count
foreach($sh in $_currenthpvm){
    Write-Output $sh
    #Update-AzWvdSessionHost -ResourceGroupName $resourcegroupname -HostPoolName $hostPoolName -Name $sh -AllowNewSession:$true
}
Write-Output "*********End Drain Script*********"