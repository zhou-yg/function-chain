#validate if is a function or a array consists function
isAboutFn = (arg)->

  return typeof arg is 'function' or
      (isArray arg) && arg.length > 0 && arg.every (fn)->
        return typeof fn is 'function'

#validate if is a array
isArray =(arg)->
  return Array.isArray arg


module.exports = {
  isAboutFn
  isArray
}