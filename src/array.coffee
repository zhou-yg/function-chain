#push fn or fn in Array into array
arrayPush = (arr,fn)->

  [].concat fn
  .forEach (fn)-> arr.push fn
  return arr

module.exports = {
  arrayPush
}