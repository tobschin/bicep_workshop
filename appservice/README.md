# Deployment

```sh
# install bicep
$ az bicep install

# set variables
$ LOCATION=eastus2
$ RG=my-group-name
$ NAME=rollout01

# create resource group
$ az group create --name $RG --location $LOCATION

# validiere template & parameter file
$ az deployment group validate --resource-group $RG --template-file main.bicep --parameters parameter.json

# what-if template & parameter file
$ az deployment group what-if --name $NAME --resource-group $RG --template-file main.bicep --parameters parameter.json

# deploy template & parameter file
$ az deployment group create --name $NAME --resource-group $RG --template-file main.bicep --parameters parameter.json

# create resource group
$ az group create --name $RG --location  $LOCATION

# clean up
$ az group delete --name $RG

```



