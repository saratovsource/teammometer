angular.module('teammometer')
  .config [
    "$stateProvider", "$urlRouterProvider", '$tRouterProvider', ($stateProvider, $urlRouterProvider, $tRouterProvider) ->
      $tRouterProvider.setTemplatesPath("templates")
      $stateProvider
        .state 'dashboard',
          url: ''
          templateUrl: $tRouterProvider.page("dashboard")
        .state 'surveys',
          url: '/surveys'
          templateUrl: $tRouterProvider.page("surveys/index")
  ]
