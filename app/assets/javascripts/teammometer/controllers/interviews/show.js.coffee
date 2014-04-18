angular.module('teammometer')
  .controller 'InterviewShowCtrl', [
    '$scope', '$location', '$state', '$stateParams', 'team_utils', 'InterviewForm',
    ($scope, $location, $state, $stateParams, team_utils, InterviewForm) ->
      $scope.team_utils = team_utils
      $scope.attraction_users = []
      $scope.referention_users = []
      $scope.user_qualities = []
      InterviewForm.get($stateParams.token).then \
      (interview) ->
        $scope.interview = interview
        $scope.respondents = team_utils.clone interview.survey.respondents
        $scope.personal_qualities = interview.survey.personalQualities

      $scope.attracted = (resp) ->
        resp in $scope.attraction_users
      $scope.referented = (resp) ->
        resp in $scope.referention_users
      $scope.have_quality = (ql) ->
        ql in $scope.user_qualities

      $scope.valid = () ->
        $scope.attraction_users.length >= 3 &&
        $scope.referention_users.length >= 3 &&
        $scope.user_qualities.length >= 3

      $scope.save = () ->
        $scope.interview.answer =
          attraction:         team_utils.to_hsh( $scope.attraction_users )
          referention:        team_utils.to_hsh( $scope.referention_users )
          personal_qualities: team_utils.to_hsh( $scope.user_qualities )
        $scope.finish = true
  ]
