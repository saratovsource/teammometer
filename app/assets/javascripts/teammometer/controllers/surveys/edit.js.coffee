angular.module('teammometer')
  .controller 'SurveyCtrlEdit', [
    '$scope', '$location', '$state', 'Survey','$stateParams', 'Respondent',
    ($scope, $location, $state, Survey, $stateParams, Respondent) ->
      Survey.get($stateParams.id).then \
      (survey) ->
        $scope.survey = survey
      $scope.saveSurvey = ->
        $scope.survey.save().then \
          (result) -> $state.go('surveys.list')
      $scope.add_respondent = () ->
        respondent = new Respondent()
        $scope.survey.respondents.push(respondent)
      $scope.remove_respondent = (resp) ->
        resp["_destroy"] = 1
  ]
