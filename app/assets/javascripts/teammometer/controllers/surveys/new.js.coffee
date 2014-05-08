angular.module('teammometer')
  .controller 'SurveysCtrlNew', [
    '$scope', '$location', '$state', '$stateParams', 'Survey', 'Respondent', 'PersonalQuality', 'SurveyTemplate'
    ($scope, $location, $state, $stateParams, Survey, Respondent, PersonalQuality, SurveyTemplate) ->
      SurveyTemplate.get($stateParams.template).then \
      (result) ->
        $scope.survey = new Survey(respondents_attributes: [])
        $scope.survey.apply_template( result )

      $scope.update_template = (template) ->
        $scope.survey.apply_template(template)

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
