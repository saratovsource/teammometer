angular.module('teammometer')
  .controller 'InterviewShowCtrl', [
    '$scope', '$location', '$state', '$stateParams', 'InterviewForm',
    ($scope, $location, $state, $stateParams, InterviewForm) ->
      InterviewForm.get($stateParams.token).then \
      (interview) ->
        $scope.interview = interview
        console.debug $scope.interview
  ]
