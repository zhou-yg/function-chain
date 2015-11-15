Z = require '../index'

fn0 = (next)->
  return (initArg)->
    console.log initArg
    next initArg + 'a'

fn1 = (next)->
  return (pre)->
    console.log pre
    if next
      next pre + 'b'
    else
      console.log '---- end b ----'

fn2 = (next)->
  return (pre)->
    console.log pre
    if next
      next pre + 'c'
    else
      console.log '---- end c ----'

fn3 = (next)->
  return (pre)->
    console.log pre
    if next
      next pre + 'd'
    else
      console.log '---- end d----'

fn4 = (next)->
  return (pre)->
    console.log pre
    if next
      next pre + 'e'
    else
      console.log '---- end e----'

fn5 = (next)->
  return (pre)->
    console.log pre
    if next
      next pre + 'f'
    else
      console.log '---- end f----'

# a -> a
#start = fn0(fn1(fn2(fn3)))

s = Z [fn0,fn1]

s1 = s.connect [fn2]

b1 = s.branch [fn3,fn4]
b2 = s.branch [fn5,fn5]

s 0
#s1 1
#s2 2

###


###

#串行 serial
#1.
#0
#0a
#0ab
#0abc

#并行 parallel
#2.
#0
#0a
#--
#0ab
#0ac