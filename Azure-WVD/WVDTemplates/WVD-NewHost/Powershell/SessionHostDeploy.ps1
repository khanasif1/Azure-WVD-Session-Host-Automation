<#
***********************************************************
***********Deploy VM using image from SIG *****************
***********************************************************
#>

Connect-AzAccount
Set-AzContext -SubscriptionId "9907fc36-386a-48e6-9b00-0470d5f7cab7"
Get-AzContext

New-AzResourceGroupDeployment -Name WVDDeployment-SIG -ResourceGroupName wvd-arm-automate `
  -TemplateFile .\Azure-WVD\WVDTemplates\WVD-NewHost\ARM\azuredeploy.json `
  -TemplateParameterFile .\Azure-WVD\WVDTemplates\WVD-NewHost\ARM\azuredeploy.parameters.json `
  -Mode Incremental 
  

  