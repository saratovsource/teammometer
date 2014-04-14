angular.module('teammometer')
  .controller 'SurveysCtrlList', [
    '$scope', '$location', 'Survey', ($scope, $location, Survey) ->
      $scope.reload = ->
        Survey.query().then \
          (collection) ->
            $scope.surveys = collection

      $scope.delete_survey = (survey) ->
        survey.delete().then \
          $scope.surveys.splice(index, 1) for index, value of $scope.surveys when value is survey
      $scope.reload()
  ]
