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
          url: '/template/:template/new'
          templateUrl: $tRouterProvider.page("surveys/new")
          controller: 'SurveysCtrlNew'
        .state 'surveys.show',
          url: '/{id}'
          templateUrl: $tRouterProvider.page("surveys/show")
          controller: 'SurveyCtrlShow'
        .state 'surveys.edit',
          url: '/{id}/edit'
          templateUrl: $tRouterProvider.page("surveys/edit")
          controller: 'SurveyCtrlEdit'
  ]
