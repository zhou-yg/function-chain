{ isAboutFn,isArray } = require './utils'
{ branch,isBranch,getBranch } = require './branch'
{ arrayPush } = require './array'
{ connect } = require './connect'

compose = (fnArr, end)->

  if isArray end
    end.array = true

  return fnArr.reduceRight (preResult, fn)->
    if isBranch fn && !end.array
      return (pre)->
        fn.map (branchFnStack)->
          return compose branchFnStack,preResult
        .forEach (branchFn)->
          branchFn pre
    else
      return fn preResult
  ,end


#currying
buildChainCurry = (startArg, endArg, fnStack)->
  if isAboutFn startArg
    return buildChain startArg, fnStack
  else
    return (compose fnStack, endArg) startArg

buildChain = (startArg, fnStack)->
  ### 引用传递，前后影响，单链条
  [].concat startArg
    .forEach (fn)->
      endArg.push fn
  ###

  #非引用，多链条(默认)
  fnStack = fnStack.concat startArg

  chain = (_startArg, _endArg)->
    return buildChainCurry _startArg, _endArg, fnStack

  chain = connect chain,buildChainCurry,fnStack
  chain = branch chain,buildChainCurry,fnStack

  return chain

# startArg,endArg
# 函数链的开始运转的时候的头部函数的参数，和尾部函数的参数
# _startAg,_endArg
# 函数链构建的函数，或是包含函数的数组，和闭包缓存的函数链
Z = (startArg)->
  return buildChain startArg, []


#子片段
Z.partial = (fnArr)->
  return (fn)->
    return Z fnArr, fn


module.exports = Z
this.Z = Z