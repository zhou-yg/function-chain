{ isArray } = require './utils'
{ arrayPush } = require './array'

isBranch = isArray

#get the last element of array
# &branch
getBranch = (arr)->
  last = arr[arr.length-1]
  if isBranch last
    return last
  else
    newBranch = []
    arr.push newBranch
    return newBranch
###
new a fn branch
###
branch = (obj,curring,fnStack)->

  obj.branch = obj.b = (fnArr)->

    branch = getBranch fnStack

    branchFnStack = []
    #因为arrayPush的concat，所以这里要包裹[]
    arrayPush branch,[branchFnStack]
    arrayPush branchFnStack,fnArr

    return (_startArg,_endArg)->
      return curring _startArg,_endArg,branchFnStack

  return obj

module.exports = {
  isBranch
  getBranch
  branch
}