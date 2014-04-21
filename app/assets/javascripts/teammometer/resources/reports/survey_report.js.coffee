angular.module('teammometer')
  .factory 'SurveyReport', [
    'railsResourceFactory', 'railsSerializer', (railsResourceFactory, railsSerializer) ->
      railsResourceFactory
        url: '/api/surveys/{{surveyId}}/report'
        name: "survey_report"
  ]
