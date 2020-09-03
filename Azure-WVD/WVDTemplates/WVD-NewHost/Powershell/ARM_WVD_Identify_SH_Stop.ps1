
param(
     [string] $hostPoolName =$(throw "hostPoolName is required.")
    ,[string] $resourcegroupname =$(throw "resourcegroupname is required.")
    ,[string] $fqdn =$(throw "dc fqdn is required.")
    ,$hp_vm =$(throw "vm array is required.")
    ,$sh_name =$(throw "sh array is required.")
)
Write-Output "*********Start VM to Stop Script*********"
#$hp_vm = '["SIG1-VM0","SIG0-VM0"]'
#$sh_name = '["SIG1-VM0.wvdarm.com","SIG0-VM0.wvdarm.com"]'
$_currenthpvm=$hp_vm | ConvertFrom-Json
$_sh_name = $sh_name | ConvertFrom-Json
Write-Output $_currenthpvm.Count
Write-Output $_sh_name.Count

$stopvmlist=@()

foreach($sh in $_sh_name){
   
    $sessions= Get-AzWvdUserSession -ResourceGroupName wvd-arm-cross-subs -HostPoolName wvd-arm-dist-hp1 -SessionHostName $sh
    if($null -eq $sessions){
     Write-Output "No active session stopping VM"
     $stopvmlist += $sh.Replace($FQDN,"")
    }else{
     Write-Output "Active VM untouch"
    } 
 }
 $stopvmlistjson = $stopvmlist | ConvertTo-Json -Compress
 echo "##vso[task.setvariable variable=stop_vm_list]$stopvmlistjson"
 Write-Output "*********End VM to Stop Script*********"
