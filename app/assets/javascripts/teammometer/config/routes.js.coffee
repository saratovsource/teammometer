angular.module('teammometer')
  .config [
    "$locationProvider", ($locationProvider) ->
      $locationProvider.html5Mode(true)
  ]
