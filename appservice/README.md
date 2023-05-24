# Deployment

```sh
# install bicep
$ az bicep install

# set variables
$ LOCATION=eastus
$ RG=my-group-name
$ NAME=rollout01

# create resource group
$ az group create --name $RG --location $LOCATION

# validiere template & parameter file
$ az deployment group validate --resource-group $RG --template-file main.bicep --parameters parameters.json

# what-if template & parameter file
$ az deployment group what-if --name $NAME --resource-group $RG --template-file main.bicep --parameters parameters.json

# deploy template & parameter file
$ az deployment group create --name $NAME --resource-group $RG --template-file main.bicep --parameters parameters.json

# create resource group
$ az group create --name $RG --location  $LOCATION

# clean up
$ az group delete --name $RG

```



