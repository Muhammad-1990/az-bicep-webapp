param name string
param location string
param id string

resource appServiceApp 'Microsoft.Web/sites@2022-03-01' = {
  name: name
  location: location
  properties: {
    serverFarmId: id
  }
}
