angular.module('teammometer')
  .factory 'Respondent', [
    'railsResourceFactory', 'railsSerializer', (railsResourceFactory, railsSerializer) ->
      railsResourceFactory()
  ]
