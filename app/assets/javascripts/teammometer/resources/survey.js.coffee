angular.module('teammometer')
  .factory 'Survey', [
    'railsResourceFactory', 'railsSerializer', 'Respondent', (railsResourceFactory, railsSerializer, Respondent) ->
      railsResourceFactory
        url: '/api/surveys'
        name: 'survey'
        serializer: railsSerializer ->
          @nestedAttribute('respondents')
          # @serializeWith('respondents', Respondent)
  ]
