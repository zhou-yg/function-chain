// Generated by CoffeeScript 1.8.0
(function() {
  var arrayPush, connect;

  arrayPush = require('./array').arrayPush;


  /*
    连接函数
    fnStack = [fn,fn,...fn]
   */

  connect = function(obj, curring, fnStack) {
    obj.connect = obj.c = function(fnArr) {
      arrayPush(fnStack, fnArr);
      return function(_startArg, _endArg) {
        return curring(_startArg, _endArg, fnStack.slice());
      };
    };
    return obj;
  };

  module.exports = {
    connect: connect
  };

}).call(this);

//# sourceMappingURL=connect.js.map
