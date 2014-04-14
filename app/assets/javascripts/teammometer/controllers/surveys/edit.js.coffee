angular.module('teammometer')
  .controller 'SurveyCtrlEdit', [
    '$scope', '$location', '$state', 'Survey','$stateParams',
    ($scope, $location, $state, Survey, $stateParams) ->
      Survey.get($stateParams.id).then \
      (survey) ->
        $scope.survey = survey
      $scope.saveSurvey = ->
        $scope.survey.save().then \
          (result) -> $state.go('surveys.list')
  ]
