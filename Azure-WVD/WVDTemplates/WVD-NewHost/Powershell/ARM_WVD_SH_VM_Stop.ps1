
param(     
     [string] $resourcegroupname =$(throw "resourcegroupname is required.")    
    ,$stop_sh =$(throw "vm array is required.")   
)

#Connect-AzAccount
#Get-AzSubscription | Out-GridView -PassThru | Select-AzSubscription
#Disconnect-AzAccount

Write-Output "*********Start Stop VM Script*********"
#$stop_sh = '["SIG-VM0"]'
$resourcegroupname = "wvd-arm-automate"
#$sh_name = '["SIG1-VM0.wvdarm.com","SIG0-VM0.wvdarm.com"]'
$_shtostop=$stop_sh | ConvertFrom-Json

Write-Output $_shtostop.Count

foreach($vm in $_shtostop){  
     Write-Output $vm
     Stop-AzVM -ResourceGroupName $resourcegroupname -Name $vm -Force
     
 }
 Write-Output "*********End Stop VM Script*********"
