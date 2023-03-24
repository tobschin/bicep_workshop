resource learntemplatestorage123 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: 'learntemplatestorage123'
  location: 'westus'
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    supportsHttpsTrafficOnly: true
  }
}