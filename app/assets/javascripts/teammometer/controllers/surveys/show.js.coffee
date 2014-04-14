angular.module('teammometer')
  .controller 'SurveyCtrl', [
    '$scope', '$location', '$state', 'Survey','$stateParams',
    ($scope, $location, $state, Survey, $stateParams) ->
      Survey.get($stateParams.id).then \
      (survey) ->
        $scope.survey = survey
  ]
