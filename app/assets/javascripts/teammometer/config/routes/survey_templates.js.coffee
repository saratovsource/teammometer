angular.module('teammometer')
  .config [
    "$stateProvider", "$urlRouterProvider", '$tRouterProvider', ($stateProvider, $urlRouterProvider, $tRouterProvider) ->
      $tRouterProvider.setTemplatesPath("templates")
      $stateProvider
        .state 'templates',
          abstract: true
          url: "/survey_templates"
          templateUrl: $tRouterProvider.page("templates/index")
        .state 'templates.list',
          url: ''
          templateUrl: $tRouterProvider.page("templates/list")
          controller: 'SurveyTemplatesCtrlList'
        .state 'templates.new',
          url: '/new'
          templateUrl: $tRouterProvider.page("templates/new")
          controller: 'SurveyTemplatesCtrlNew'
        .state 'templates.edit',
          url: '/{id}/edit'
          templateUrl: $tRouterProvider.page("templates/edit")
          controller: 'SurveyTemplatesCtrlEdit'
  ]
