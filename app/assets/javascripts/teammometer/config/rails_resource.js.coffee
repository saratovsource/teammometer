angular.module('teammometer')
  .config [
    'RailsResourceProvider', (RailsResourceProvider) ->
      RailsResourceProvider.underscoreParams(true)
  ]
