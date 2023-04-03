param name string
param location string

resource appServicePlan 'Microsoft.Web/serverFarms@2022-03-01' = {
  name: name
  location: location
  sku: {
    name: 'F1'
  }
}

output Id string = appServicePlan.id
