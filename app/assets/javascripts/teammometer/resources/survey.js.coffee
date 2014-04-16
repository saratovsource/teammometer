angular.module('teammometer')
  .factory 'Survey', [
    'railsResourceFactory', 'railsSerializer', 'Respondent', (railsResourceFactory, railsSerializer, Respondent) ->
      res = railsResourceFactory
        url: '/api/surveys'
        name: 'survey'
        serializer: railsSerializer ->
          @nestedAttribute('respondents')
      res.prototype.start = () ->
        @state = 'started'
        @state_event = "start"
        @save()
      res.prototype.finish = () ->
        @state = 'finished'
        @state_event = "finish"
        @save()
      res
  ]
