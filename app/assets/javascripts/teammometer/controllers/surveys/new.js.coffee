angular.module('teammometer')
  .controller 'SurveysCtrlNew', [
    '$scope', '$location', '$state', 'Survey', 'Respondent', 'PersonalQuality',
    ($scope, $location, $state, Survey, Respondent, PersonalQuality) ->
      $scope.survey = new Survey(respondents_attributes: [])
      $scope.saveSurvey = ->
        $scope.survey.save().then \
          (result) -> $state.go('surveys.list')
      $scope.add_respondent = () ->
        respondent = new Respondent()
        $scope.survey.respondents.push(respondent)
      $scope.remove_respondent = (resp) ->
        resp["_destroy"] = 1
      $scope.query = (q) ->
        PersonalQuality.query({ query: q })
  ]
