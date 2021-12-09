# L-exercise

This repo contains the files required to install and run the application steve-vote. The application is based on one used in a MS Quickstart located here:

https://docs.microsoft.com/en-us/azure/aks/kubernetes-walkthrough-rm-template
	
The steve-vote application runs on a AKS cluster.

Files required:

1. wholeShebang.ps1 - script to create the AKS cluster and deploy the app.
2. steve-vote-redis.yaml - file used to deploy the app.
3. kiAKSclstr.ps1 - script to destroy the cluster.

All files must be copied to an Azure Cloud Shell and the scripts run from there.
