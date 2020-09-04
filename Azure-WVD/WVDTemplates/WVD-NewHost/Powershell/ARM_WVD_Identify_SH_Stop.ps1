
param(
     [string] $hostPoolName =$(throw "hostPoolName is required.")
    ,[string] $resourcegroupname =$(throw "resourcegroupname is required.")
    ,[string] $fqdn =$(throw "dc fqdn is required.")
    ,$hp_vm =$(throw "vm array is required.")
    ,$sh_name =$(throw "sh array is required.")
)
Write-Output "*********Start VM to Stop Script*********"
#Connect-AzAccount
#Get-AzSubscription | Out-GridView -PassThru | Select-AzSubscription
#Disconnect-AzAccount

#$hp_vm = '["SIG1-VM0","SIG0-VM0"]'
#$sh_name = '["SIG1-VM0.wvdarm.com","SIG0-VM0.wvdarm.com"]'
<#$hostPoolName ="wvd-arm-dist-hp1"
,$resourcegroupname ="wvd-arm-cross-subs"
,$fqdn =".wvdarm.com"#>

$SessionHost=Get-AzWvdSessionHost -HostPoolName $hostPool.Name -ResourceGroupName $resourcegroupname

$stopvmlist=@()
foreach($sh in $SessionHost){
    $splitValues = $sh.Name.Split("/")
   
   [int]$splitCount= $splitValues.count
    $lastrecordIndex=$splitCount-1
    
    Write-Output $sh.Name.Split("/")[$lastrecordIndex].Replace($FQDN,"")
    $currentshname = $sh.Name.Split("/")[$lastrecordIndex]
    Write-Output $currentshname
    $sessions= Get-AzWvdUserSession -ResourceGroupName $resourcegroupname -HostPoolName $hostPoolName -SessionHostName $currentshname
    
    if($null -eq $sessions){
     Write-Output "No active session stopping VM"
     $stopvmlist += $currentshname.Replace($FQDN,"")
    }else{
     Write-Output "Active VM untouch"
    } 

}
$stopvmlistjson = $stopvmlist | ConvertTo-Json -Compress
Write-Output $stopvmlistjson
echo "##vso[task.setvariable variable=stop_vm_list]$stopvmlistjson"
Write-Output "*********End VM to Stop Script*********"