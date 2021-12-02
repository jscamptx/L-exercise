# create AKS cluster

$subID = "xxxxx" #put in real value here
$resourceGroup = "psResourceGroup"
$location = "eastus"
$clusterName = "psAKSCluster"

Set-AzContext -SubscriptionId $subID
New-AzResourceGroup -Name $resourceGroup -Location $location
New-AzAksCluster -ResourceGroupName $resourceGroup -Name $clusterName -NodeCount 1