#= require_self
#= require_tree ./lib
#= require_tree ./config
#= require_tree ./resources
#= require_tree ./controllers

angular.module('teammometer.lib', [])
angular.module('teammometer.directives', [])
angular.module('teammometer.controllers', [])
angular.module('teammometer.resources', [])
  .run [
    '$rootScope', '$state', '$stateParams',
    ($rootScope,   $state,   $stateParams) ->
      $rootScope.$state = $state
      $rootScope.$stateParams = $stateParams
  ]
