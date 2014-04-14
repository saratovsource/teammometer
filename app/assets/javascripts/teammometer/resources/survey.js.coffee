angular.module('teammometer')
  .factory 'Survey', [
    'railsResourceFactory', (railsResourceFactory) ->
      railsResourceFactory
        url: '/api/surveys'
        name: 'survey'
  ]
