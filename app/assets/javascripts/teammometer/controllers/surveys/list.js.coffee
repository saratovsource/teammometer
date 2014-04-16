angular.module('teammometer')
  .controller 'SurveysCtrlList', [
    '$scope', '$location', 'Survey', ($scope, $location, Survey) ->
      $scope.reload = ->
        Survey.query().then \
          (collection) ->
            $scope.surveys = collection
      $scope.reload()
  ]
