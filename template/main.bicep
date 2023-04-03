@description('Specifies the location for resources.')
param location string = 'southafricanorth'

// =========== main.bicep ===========
targetScope = 'subscription'

// Creating resource group
resource mogroup 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: 'morcsgrp'
  location: location
}

module storage './storage.bicep' = {
  name: 'storageDeployment'
  scope: mogroup
  params: {
    storageAccountName: 'mostgacc'
    location: location
  }
}

module serviceplan './appserviceplan.bicep' = {
  name: 'appserviceplan'
  scope: mogroup
  params:{
    name: 'mosvcpln'
    location: location
  }
}

module serviceapp './appserviceapp.bicep' = {
  name: 'appserviceapp'
  scope: mogroup
  params:{
    name: 'mosvcapp'
    location: location
    id:  serviceplan.outputs.Id
  }
}
