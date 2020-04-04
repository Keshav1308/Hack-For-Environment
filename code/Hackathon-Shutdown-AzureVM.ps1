<#
.SYNOPSIS
  Connects to Azure and stops of all VMs in the specified Azure subscription or resource group.

.DESCRIPTION
  This runbook connects to Azure and stops all VMs in an Azure subscription or resource group.  
  You can attach a schedule to this runbook to run it at a specific time.
#>

# Log into azure

$connectionName = "AzureRunAsConnection"
$servicePrincipalConnection=Get-AutomationConnection -Name $connectionName         

"Logging in to Azure..."
Add-AzureRmAccount `
    -ServicePrincipal `
    -TenantId $servicePrincipalConnection.TenantId `
    -ApplicationId $servicePrincipalConnection.ApplicationId `
    -CertificateThumbprint $servicePrincipalConnection.CertificateThumbprint 

$AzureSubscriptionIdAssetName = 'e4da1c70-3730-4dc6-94e6-c686af31651b'
$ResourceGroupName = 'Keshav1308'


if($err) {
	throw $err
}



# If there is a specific resource group, then get all VMs in the resource group,
# otherwise get all VMs in the subscription.

if ($ResourceGroupName) 
{ 
	$VMs = Get-AzureRmVM -ResourceGroupName $ResourceGroupName
}
else 
{ 
	$VMs = Get-AzureRmVM
}

# Stop each of the VMs
foreach ($VM in $VMs)
{
	$StopRtn = $VM | Stop-AzureRmVM -Force -ErrorAction Continue

	if ($StopRtn.Status -ne 'Succeeded')
	{
		# The VM failed to stop, so send notice
        Write-Output ($VM.Name + " failed to stop")
        Write-Error ($VM.Name + " failed to stop. Error was:") -ErrorAction Continue
		Write-Error (ConvertTo-Json $StopRtn.Error) -ErrorAction Continue
	}
	else
	{
		# The VM stopped, so send notice
		Write-Output ($VM.Name + " has been stopped")
	}
}
