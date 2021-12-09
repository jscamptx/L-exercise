# app deploy

$resourceGroup = "psResourceGroup"
$clusterName = "psAKSCluster"
$appDeploy = "steve-vote-redis.yaml"
$service = "azure-vote-front"

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