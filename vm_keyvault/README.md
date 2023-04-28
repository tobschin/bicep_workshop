# VM-Creation by Bicep

## Create Azure KeyVault

```sh
# Set variables
RG=<MyResourceGroup>
LOCATION=<MyLocation>

az group create --name $RG --location $LOCATION

# create KeyVault
VAULT_NAME=ExampleVault
$ az keyvault create \
  --name $VAULT_NAME \
  --resource-group $RG \
  --location $LOCATION \
  --enabled-for-template-deployment true 

# show keyvault id
az keyvault show --name $VAULT_NAME --query id

# set secret
$ az keyvault secret set --vault-name $VAULT_NAME --name MySecretPassword --value <MyPassword>

# show secret
$ az keyvault secret show --name MySecretPassword --vault-name $VAULT_NAME

```

## Deploy Linux VM

```sh
# create Ressource Group (if not already exists)
az group create -n $RG -l $LOCATION

# deploy
az deployment group create --resource-group $RG --template-file main.bicep --parameters parameters.json
```