angular.module('teammometer')
  .config [
    "$stateProvider", "$urlRouterProvider", '$tRouterProvider', ($stateProvider, $urlRouterProvider, $tRouterProvider) ->
      $tRouterProvider.setTemplatesPath("templates")
      $stateProvider
        .state 'surveys',
          abstract: true
          url: "/surveys"
          templateUrl: $tRouterProvider.page("surveys/index")
        .state 'surveys.list',
          url: ''
          templateUrl: $tRouterProvider.page("surveys/list")
          controller: 'SurveysCtrlList'
        .state 'surveys.new',
          url: '/new'
          templateUrl: $tRouterProvider.page("surveys/new")
          controller: 'SurveysCtrlNew'
        .state 'surveys.show',
          url: '/{id:[0-9]{1,8}}'
          templateUrl: $tRouterProvider.page("surveys/show")
          controller: 'SurveyCtrl'
        .state 'surveys.edit',
          url: '/{id:[0-9]{1,8}}/edit'
          templateUrl: $tRouterProvider.page("surveys/edit")
          controller: 'SurveyCtrlEdit'
  ]
