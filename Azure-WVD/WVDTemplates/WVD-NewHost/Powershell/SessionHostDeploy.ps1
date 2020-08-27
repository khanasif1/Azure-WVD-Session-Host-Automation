Connect-AzAccount
Set-AzContext -SubscriptionId "9907fc36-386a-48e6-9b00-0470d5f7cab7"
Get-AzContext

New-AzResourceGroupDeployment -Name ExampleDeployment -ResourceGroupName ExampleResourceGroup `
  -TemplateFile .\WVDTemplates\WVD-NewHost\vm-from-sig\azuredeploy.json `
  -TemplateParameterFile .\WVDTemplates\WVD-NewHost\vm-from-sig\azuredeploy.parameters.json `
  -Mode Incremental 
  

  