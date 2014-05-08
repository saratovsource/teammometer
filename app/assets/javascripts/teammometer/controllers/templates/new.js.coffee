angular.module('teammometer')
  .controller 'SurveyTemplatesCtrlNew', [
    '$scope', '$location', '$state', 'SurveyTemplate', 'PersonalQuality',
    ($scope, $location, $state, SurveyTemplate, PersonalQuality) ->
      $scope.template = new SurveyTemplate()
      $scope.query = (q) ->
        PersonalQuality.query({ query: q })

      $scope.saveTemplate = ->
        $scope.template.save().then \
          (result) -> $state.go('templates.list')
  ]
