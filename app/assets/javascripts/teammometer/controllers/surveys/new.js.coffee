angular.module('teammometer')
  .controller 'SurveysCtrlNew', [
    '$scope', '$location', '$state', 'Survey', ($scope, $location, $state, Survey) ->
      $scope.survey = new Survey()
      $scope.saveSurvey = ->
        $scope.survey.save().then \
          (result) -> $state.go('surveys.list')
  ]
