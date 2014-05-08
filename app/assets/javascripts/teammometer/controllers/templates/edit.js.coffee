angular.module('teammometer')
  .controller 'SurveyTemplatesCtrlEdit', [
    '$scope', '$location', '$state', '$stateParams', 'SurveyTemplate', 'PersonalQuality',
    ($scope, $location, $state, $stateParams, SurveyTemplate, PersonalQuality) ->

      $scope.query = (q) ->
        PersonalQuality.query({ query: q })

      $scope.saveTemplate = ->
        $scope.template.save().then \
          (result) -> $state.go('templates.list')

      SurveyTemplate.get($stateParams.id).then \
      (template) ->
        $scope.template = template
  ]
