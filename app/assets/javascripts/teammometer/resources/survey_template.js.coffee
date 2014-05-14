angular.module('teammometer')
  .factory 'SurveyTemplate', [
    'railsResourceFactory', 'railsSerializer', (railsResourceFactory, railsSerializer) ->
      res = railsResourceFactory
        url: '/api/templates'
        name: 'survey_template'
      res.prototype.from_survey = (survey) ->
        @title = "#{survey.title} (template)"
        @attractionQuestion = survey.attractionQuestion
        @personalQualities = survey.personalQualities
        @personalQualitiesQuestion = survey.personalQualitiesQuestion
        @referentionQuestion = survey.referentionQuestion
      res
  ]
