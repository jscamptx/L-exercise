<# 
	wholeShebang.ps1
	
	This script creates an AKS cluster in Azure, then deploys a web application 
	to that cluster. The application is based on one used in a MS Quickstart 
	located here:
	
	https://docs.microsoft.com/en-us/azure/aks/kubernetes-walkthrough-rm-template
	
	The script is meant to be run in an Azure Clould Shell.
#>
$subID = "xxxxx" #put in real value here
$resourceGroup = "psResourceGroup"
$location = "eastus"
$clusterName = "psAKSCluster"
$appDeploy = "steve-vote-redis.yaml"
$service = "azure-vote-front"

#create AKS cluster

Set-AzContext -SubscriptionId $subID
New-AzResourceGroup -Name $resourceGroup -Location $location
New-AzAksCluster -ResourceGroupName $resourceGroup -Name $clusterName -NodeCount 2

# app deploy

Import-AzAksCredential -Force -ResourceGroupName $resourceGroup -Name $clusterName
kubectl apply -f $appDeploy

for ($i = 0; $i -lt 2000; $i++)
{
	$ret = kubectl get service $service
	if ($ret -match 'pending')
	{
		if ($i -eq 0)
		{
			Write-Output "Waiting for external IP to be created..."
		}
		else
		{
			 Write-Host -NoNewLine "."
		}
	}
	else
	{
		Write-Host "."
		Write-Output "Almost ready..."
		for ($j = 0; $j -lt 20; $j++)
		{
			Write-Host -NoNewLine "."
			Start-Sleep -s 2
		}
		Write-Host "."
		Write-Output $ret
		break
	}
}
