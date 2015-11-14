{ arrayPush } = require './array'
###
  连接函数
  fnStack = [fn,fn,...fn]
###
connect = (obj,curring,fnStack)->

  obj.connect = obj.c = (fnArr)->
    arrayPush fnStack,fnArr

    return (_startArg,_endArg)->
      #slice，防止引用
      return curring _startArg,_endArg,fnStack.slice()

  return obj

module.exports = {
  connect
}