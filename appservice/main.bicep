param webAppName string
param repositoryUrl string
param branch string = 'main'
param linuxFxVersion string = 'node|14-lts' // The runtime stack of web app
@allowed(['F1'])
param sku string = 'F1'
param location string = resourceGroup().location
param logoSrc string

var webSiteName = toLower(webAppName)
var appServicePlanName = toLower('AppServicePlan-${webAppName}')

resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: appServicePlanName
  location: location
  properties: {
    reserved: true
  }
  sku: {
    name: sku
  }
  kind: 'linux'
}

resource appService 'Microsoft.Web/sites@2020-06-01' = {
  name: webSiteName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: linuxFxVersion
      appSettings: [{
        name: 'REACT_APP_IMAGE_SRC'
        value: logoSrc
      }]
    }
  }
}

resource srcControls 'Microsoft.Web/sites/sourcecontrols@2021-01-01' = {
  parent: appService
  name: 'web'
  properties: {
    repoUrl: repositoryUrl
    branch: branch
    isManualIntegration: true
  }
}

output url string = 'http://${webSiteName}.azurewebsites.net'
