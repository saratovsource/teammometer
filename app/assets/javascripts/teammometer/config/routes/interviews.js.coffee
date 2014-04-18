angular.module('teammometer')
  .config [
    "$stateProvider", "$urlRouterProvider", '$tRouterProvider', ($stateProvider, $urlRouterProvider, $tRouterProvider) ->
      $tRouterProvider.setTemplatesPath("templates")
      $stateProvider
        .state 'interview',
          url: '/interviews/:token'
          templateUrl: $tRouterProvider.page("interviews/show")
          controller: 'InterviewShowCtrl'
  ]
