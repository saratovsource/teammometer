angular.module('teammometer')
  .controller 'SurveyCtrlShow', [
    '$scope', '$location', '$state', 'Survey', 'SurveyReport', '$stateParams',
    ($scope, $location, $state, Survey, SurveyReport, $stateParams) ->
      Survey.get($stateParams.id).then \
      (survey) -> $scope.processSurvey(survey)

      $scope.getReport = (survey) ->
        SurveyReport.query(null, {surveyId: survey.id}).then \
        (report) -> $scope.processReport(report)

      $scope.processSurvey = (survey) ->
        $scope.getReport(survey)

      $scope.processReport = (report) ->
        console.debug report

  ]
