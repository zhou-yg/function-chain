// Generated by CoffeeScript 1.8.0
(function() {
  var b1, b2, fn0, fn1, fn2, fn3, fn4, fn5, s, s1;

  fn0 = function(next) {
    return function(initArg) {
      console.log(initArg);
      return next(initArg + 'a');
    };
  };

  fn1 = function(next) {
    return function(pre) {
      console.log(pre);
      if (next) {
        return next(pre + 'b');
      } else {
        return console.log('---- end b ----');
      }
    };
  };

  fn2 = function(next) {
    return function(pre) {
      console.log(pre);
      if (next) {
        return next(pre + 'c');
      } else {
        return console.log('---- end c ----');
      }
    };
  };

  fn3 = function(next) {
    return function(pre) {
      console.log(pre);
      if (next) {
        return next(pre + 'd');
      } else {
        return console.log('---- end d----');
      }
    };
  };

  fn4 = function(next) {
    return function(pre) {
      console.log(pre);
      if (next) {
        return next(pre + 'e');
      } else {
        return console.log('---- end e----');
      }
    };
  };

  fn5 = function(next) {
    return function(pre) {
      console.log(pre);
      if (next) {
        return next(pre + 'f');
      } else {
        return console.log('---- end f----');
      }
    };
  };

  s = Z([fn0, fn1]);

  s1 = s.connect([fn2]);

  b1 = s.branch([fn3, fn4]);

  b2 = s.branch([fn5, fn5]);

  s(0);


  /*
   */

}).call(this);

//# sourceMappingURL=index.js.map
