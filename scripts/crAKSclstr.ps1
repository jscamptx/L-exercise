# create AKS cluster

$subID = "d355c0a2-8853-43b3-b11f-4b1379d7751b"
$resourceGroup = "psResourceGroup"
$location = "eastus"
$clusterName = "psAKSCluster"

Set-AzContext -SubscriptionId $subID
New-AzResourceGroup -Name $resourceGroup -Location $location
New-AzAksCluster -ResourceGroupName $resourceGroup -Name $clusterName -NodeCount 1