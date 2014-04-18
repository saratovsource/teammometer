angular.module('teammometer.lib')
  .provider '$tRouter', TeamRouter = ->
    setTemplatesPath: (path) ->
      @templates_path = path
    template: (name) ->
      "/#{@templates_path}/#{name}"
    page: (name) ->
      @template("pages/#{name}")

    $get: () ->
