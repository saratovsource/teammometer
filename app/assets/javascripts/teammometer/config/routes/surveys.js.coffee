angular.module('teammometer')
  .config [
    "$stateProvider", "$urlRouterProvider", '$tRouterProvider', ($stateProvider, $urlRouterProvider, $tRouterProvider) ->
      $tRouterProvider.setTemplatesPath("templates")
      $stateProvider
        .state 'surveys',
          abstract: true
          url: "/surveys"
          templateUrl: $tRouterProvider.page("surveys/index")
          controller: 'SurveysCtrlList'
        .state 'surveys.list',
          url: ''
          templateUrl: $tRouterProvider.page("surveys/list")
        .state 'surveys.new',
          url: '/new'
          templateUrl: $tRouterProvider.page("surveys/new")
          controller: 'SurveysCtrlNew'
  ]
