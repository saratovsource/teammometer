angular.module('teammometer')
  .controller 'SurveyCtrlShow', [
    '$scope', '$location', '$state', '$q', 'Survey', 'SurveyReport', '$stateParams',
    ($scope, $location, $state, $q, Survey, SurveyReport, $stateParams) ->
      $scope.load_data = () ->
        Survey.get($stateParams.id).then \
        (survey) -> $scope.processSurvey(survey)

      $scope.getReport = (survey) ->
        $scope.survey = survey
        SurveyReport.query(null, {surveyId: survey.id}).then \
        (report) -> $scope.processReport(report)

      $scope.processSurvey = (survey) ->
        $scope.getReport(survey)

      $scope.processReport = (report) ->
        $scope.report = report
        $scope.users_map = {}
        for resp in report.respondents
          $scope.users_map[resp.id] = resp
        $scope.sociometry = report.sociometry
        $scope.referentometry = report.referentometry
        $scope.$broadcast('reportLoaded')

      $scope.load_data()
  ]
