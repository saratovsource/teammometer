angular.module('teammometer')
  .factory 'PersonalQuality', [
    'railsResourceFactory', 'railsSerializer', (railsResourceFactory, railsSerializer) ->
      railsResourceFactory
        url: "/api/personal_qualities"
        name: "personal_quality"
  ]
