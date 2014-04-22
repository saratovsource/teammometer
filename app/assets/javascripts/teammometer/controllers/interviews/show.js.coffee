angular.module('teammometer')
  .controller 'InterviewShowCtrl', [
    '$scope', '$location', '$state', '$stateParams', 'team_utils', 'InterviewForm',
    ($scope, $location, $state, $stateParams, team_utils, InterviewForm) ->
      $scope.max_users = 3
      $scope.team_utils = team_utils
      $scope.attraction_users = []
      $scope.referention_users = []
      $scope.user_qualities = []
      InterviewForm.get($stateParams.token).then \
      (interview) ->
        $scope.interview = interview
        $scope.survey = interview.survey
        $scope.respondents = team_utils.clone interview.survey.respondents
        $scope.personal_qualities = interview.survey.personalQualities.map (itm) -> itm.name
        $scope.current_respondent = interview.respondent

      $scope.attracted = (resp) ->
        resp in $scope.attraction_users
      $scope.referented = (resp) ->
        resp in $scope.referention_users
      $scope.have_quality = (ql) ->
        ql in $scope.user_qualities

      $scope.valid = () ->
        $scope.attraction_users.length >= $scope.max_users - 1 &&
        $scope.referention_users.length >= $scope.max_users - 1 &&
        $scope.user_qualities.length >= 5

      $scope.save = () ->
        $scope.interview.answer =
          attraction_users_attributes:  $scope.attraction_users.map (user, ind) ->
            {respondent_id: user.id, position: $scope.max_users - ind}

          referention_users_attributes: $scope.referention_users.map (user, ind) ->
            {respondent_id: user.id, position: $scope.max_users - ind}

          personal_quality_list: $scope.user_qualities
        $scope.interview.save().then \
        (ret) ->
          $scope.finish = true
  ]
