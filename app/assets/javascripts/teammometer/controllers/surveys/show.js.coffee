angular.module('teammometer')
  .controller 'SurveyCtrlShow', [
    '$scope', '$location', '$state', '$q', 'Survey', 'SurveyReport', 'SurveyTemplate', '$stateParams',
    ($scope, $location, $state, $q, Survey, SurveyReport, SurveyTemplate, $stateParams) ->
      $scope.current_report_url = window.location.origin + $location.url()
      $scope.loaded = false
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
        $scope.loaded = true
        $scope.report = report
        $scope.users_map = {}
        for resp in report.respondents
          $scope.users_map[resp.id] = resp
        $scope.sociometry = report.sociometry
        $scope.referentometry = report.referentometry
        $scope.$broadcast('reportLoaded')

      $scope.show_it = (header, show_dets) ->
        header == 'summary' || show_dets

      $scope.create_template = ->
        template = new SurveyTemplate()
        template.from_survey($scope.survey)
        template.save().then \
        (result) ->
          $state.go('templates.edit', {id: result.id})

      $scope.load_data()
  ]
