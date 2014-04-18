angular.module('teammometer')
  .service 'team_utils', [ ->
    clone:  (obj) ->
      if not obj? or typeof obj isnt 'object'
        return obj

      if obj instanceof Date
        return new Date(obj.getTime())

      if obj instanceof RegExp
        flags = ''
        flags += 'g' if obj.global?
        flags += 'i' if obj.ignoreCase?
        flags += 'm' if obj.multiline?
        flags += 'y' if obj.sticky?
        return new RegExp(obj.source, flags)

      newInstance = new obj.constructor()

      for key of obj
        newInstance[key] = @clone obj[key]

      return newInstance
    ,add_to: (item, collection) ->
      collection.push(item)

    ,remove_from: (item, collection) ->
      collection.splice(collection.indexOf(item), 1)

    ,to_hsh: (arr) ->
      ret = {}
      for itm, ind in arr
        ret[ind + 1] = itm
      ret
  ]
