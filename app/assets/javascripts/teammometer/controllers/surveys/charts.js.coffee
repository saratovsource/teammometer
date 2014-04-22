angular.module('teammometer')
  .controller 'SurveyChartsCtrl', [
    '$scope', '$location', '$state',
    ($scope, $location, $state) ->
      $scope.$on 'reportLoaded', () ->
        $scope.loadCharts()

      $scope.loadCharts = ()->
        $scope.respondents = $scope.report.respondents
        $scope.metrics_chart =
          type: "ColumnChart"
          data: {
            cols: [
              {id: "u", label: 'Users', type: "string"}
              {id: "s", label: "Sociometry", type: "number"}
              {id: "r", label: "Referentometry", type: "number"}
            ]
            rows: $scope.respondents.map (resp) ->
              column = [
                {v: resp.name}
                {v: $scope.sociometry.summary[resp.id]}
                {v: $scope.referentometry.summary[resp.id]}
              ]
              {c: column}
          }
  ]
