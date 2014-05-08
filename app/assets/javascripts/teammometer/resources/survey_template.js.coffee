angular.module('teammometer')
  .factory 'SurveyTemplate', [
    'railsResourceFactory', 'railsSerializer', (railsResourceFactory, railsSerializer) ->
      railsResourceFactory
        url: '/api/templates'
        name: 'survey_template'
  ]
