angular.module('teammometer')
  .controller 'SurveyTemplatesCtrlList', [
    '$scope', '$location', 'SurveyTemplate', ($scope, $location, SurveyTemplate) ->
      $scope.reload = ->
        SurveyTemplate.query().then \
        (collection) -> $scope.templates = collection

      $scope.delete = (template) ->
        template.delete().then \
        (res) -> $scope.reload()
      $scope.reload()
  ]
